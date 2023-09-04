[
  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs}", "priv/*/seeds.exs"],
  import_deps: [:ecto, :ecto_sql, :plug],
  subdirectories: ["priv/*/migrations"],
  line_length: 100
]
