# App

This project is a scalable and efficient system for processing CSV files, checking for duplicates in a database, and generating new CSV outputs. Built with Elixir, it takes advantage of concurrent data processing using the Flow library.

## Prerequisites

Make sure you have the following installed:

* Elixir: 1.15.5

* Erlang/OTP: 25.3.1

* PostgreSQL: 17.2

## Installation
1. Clone the repository:
```
$ git clone git@github.com:miniguez/sandbox_flow.git
```

2. Navigate to the project directory:

```
$ cd sandbox_flow/app
```

3. Install dependencies:

```
$ mix deps.get
```

## Configuration

```
config :app, App.Repo,
  username: "postgres",
  password: "postgres",
  database: "my_database",
  hostname: "localhost",
  pool_size: 10
  
```

## Usage

```
$ iex -S mix
iex(1)> App.process_csv_concurrently("files/test_5000.csv", "files/output.csv")
```

## License

This project is licensed under the Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0).
