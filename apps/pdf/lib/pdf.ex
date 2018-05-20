defmodule PDF do
  @moduledoc """
  Documentation for PDF.
  """

  # order = Webfront.Sales.get_order!(%{ref_no: "DY2JP2G"}) |> Webfront.Repo.preload([:tickets])
  # PDF.html("order_confirmation", []) |> PDF.generate(%{filename: "boo"})

  # def generate_from_html(template, filename, assigns) do
  #   html(template, assigns)
  #   |> generate(%{filename: filename})
  # end

  def html(template, assigns) do
    Phoenix.View.render_to_string(EMSWeb.LayoutView, "#{template}.html", assigns)
    # Phoenix.View.render_to_string(EMSWeb.PDFView, "#{template}.html", assigns)
  end

  def generate(string, %{filename: filename} = _options) do
    filepath = "/tmp/#{filename}.pdf"

    {:ok, binary_pdf_content} =
      PdfGenerator.generate_binary(string, filename: filename, page_size: "A4")

    case File.write(filepath, binary_pdf_content) do
      :ok -> {:ok, filepath}
      _ -> {:error}
    end
  end
end
