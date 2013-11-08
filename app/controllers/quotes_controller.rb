class QuotesController < Rulers::Controller
  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def a_quote
    render :a_quote, :noun => :winking
  end

  def quote_1
    quote_1 = FileModel.find(1)
    ua = request.user_agent
    render :quote, :obj => quote_1, :ua => ua
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth a thousand pixels",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, :obj => m
  end

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, :obj => quote, :ua => ua
  end

  def update_quote
    raise "Wrong HTTP Verb" unless @env['REQUEST_METHOD'] == 'POST'
    attrs = {
      "submitter" => "change user",
      "quote" => "A picture is worth a thousand words",
      "attribution" => "Change Me"
    }
    m = FileModel.update(attrs, "1")
    render :quote, :obj => m

  end
end
