defmodule App.CSVProcessor do
  import Ecto.Query
  alias NimbleCSV.RFC4180, as: CSV
  alias App.Repo
  alias App.Lead
  require Flow

  def process_csv_concurrently(file_path, output_path) do
    file_path
    |> File.stream!()
    |> CSV.parse_stream()
    |> Flow.from_enumerable()
    |> Flow.map(&(process_row(&1)))
    |> Flow.partition()
    |> Enum.to_list()
    |> generate_output_csv(output_path)
  end

  defp process_row([name, phone]) do
    is_duplicate =
      Repo.exists?(
        from l in Lead, where: l.phone == ^phone
      )

    [name, phone, is_duplicate]
  end

  defp generate_output_csv(data, output_path) do
    processed_data = Enum.map(data, fn row -> row end)
    headers = ["name", "phone", "is_duplicate"]


    csv_content =
      [headers | processed_data]
      |> Enum.map(fn row -> Enum.join(row, ",") end)
      |> Enum.join("\n")

    File.write!(output_path, csv_content)
  end
end
