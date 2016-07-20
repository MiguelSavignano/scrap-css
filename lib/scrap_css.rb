module ScrapCss
  def self.html_file(path)
    ScrapCss::Html.new(path)
  end

  def self.css_file(path)
    ScrapCss::Css.new(path)
  end

  def self.run(path_html, path_css)
    html_file = ScrapCss.html_file(path_html)
    css_file = ScrapCss.css_file(path_css)
    css_clases = html_file.css_clases
    css_file.select_css(css_clases)
    css_file.save_select_css
  end
end

class ScrapCss::Html
  def initialize(path="")
    @file_lines ||= IO.readlines(path)
    @css_clases = []
  end

  def self.get_css_clases(str)
    str.scan(/class="([^"]*)"/).flatten.map{|css| css.split(" ") }.flatten
  end

  def css_clases
    return @css_clases unless @css_clases.empty?
    @file_lines.each{ |line|
      @css_clases << ScrapCss::Html.get_css_clases(line) if line =~ /class=/
    }
    @css_clases.flatten.uniq
  end
end

class ScrapCss::Css
  def initialize(path="")
    @file_lines ||= IO.readlines(path)
    @css_clases_used = []
  end

  def select_css(css_clases_useds)
    @file_lines.each_with_index do |file_line, index|
      css_clases_useds.each do |css_clase|
        if ScrapCss::Css.str_contain_css(file_line, css_clase)
          @css_clases_used << get_css_class(index, index_close_tag(index))
        end
      end
    end
    @css_clases_used
  end

  def save_select_css
    File.open("output.css", 'w+') do |file|
      @css_clases_used.each{|css_clase_used| file.write(css_clase_used)  }
    end
  end

  def self.str_contain_css(str, css_class)
    str.include?(".#{css_class} ") || str.include?(".#{css_class}.")
  end

  def get_css_class(first_line, last_line)
    @file_lines[first_line..last_line].join("")
  end

  def index_close_tag(index)
    @file_lines[index].include?("}") ? index : index_close_tag(index+1)
  end
end
