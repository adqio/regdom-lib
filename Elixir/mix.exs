defmodule Regdom.Mixfile do
  use Mix.Project

  def project do
    [app: :regdom,
     version: "0.0.4",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: "elixir port of regdom-lib",
     package: [
       maintainers: ["Jason Fertel"],
       licenses: ["Apache 2.0"],
       links: %{"GitHub" => "https://github.com/adqio/regdom-lib"}
     ],
     name: "Regdom",
     docs: [main: "Regdom",
       canonical: "http://hexdocs.pm/regdom",
       source_url: "https://github.com/adqio/regdom-lib"
       ]
     ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: []]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:fast_yaml, "~> 1.0", only: :test}
  ]
  end
end
