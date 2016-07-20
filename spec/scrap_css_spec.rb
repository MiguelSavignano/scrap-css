require 'scrap_css'
require 'pry'
describe "ScrapCss::Html" do
  it ".get_css_clases" do
    expect(ScrapCss::Html.get_css_clases('<span class="TweetBoxExtras-item"><div class="geo-picker dropdown">'))
    .to eq(["TweetBoxExtras-item", "geo-picker", "dropdown"])
  end

  it "#css_clases" do
    html_file = ScrapCss::Html.new("spec/fixture/index.html")
    expect(html_file.css_clases.size).to eq(178)
  end
end

describe "ScrapCss::Css" do
  it ".str_contain_css" do
    expect(ScrapCss::Css.str_contain_css(".profile-card .avatar {", "avatar"))
    .to eq(true)
  end
  it "#index_close_tag" do
    expect( ScrapCss::Css.new("spec/fixture/main.css").index_close_tag(3) )
    .to eq(6)
  end

  it "#select_css" do
    css_file = ScrapCss::Css.new("spec/fixture/main.css")
    expect( css_file.select_css(["u-inline"]) ).to eq ([".u-inline {\n    display: inline!important\n}\n"])
  end
end

describe "ScrapCss" do
  it ".run" do
    ScrapCss.run("spec/fixture/index.html", "spec/fixture/main.css")
  end
end
