class HomeController < Rulers::Controller
  def index
    "This is the index page of home"
  end

  def exception
    raise "It's a bad one"
  end
end
