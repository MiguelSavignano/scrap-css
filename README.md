# ScrapCss

Get only the css used in a html portion; use to understand a web components from other web site.

##Getting started
```sh
gem install scrap-css
```
Create a html file with the portion of html you want to get the css and download the css file

##Used
```ruby
ScrapCss.run("./index.html", "./aplication.css")
```

Or use in console

```sh
scrapcss index.html aplication.css
```
output.css contain only the css used in the html

##Analize only the css file
```ruby
css_file = ScrapCss.css_file("./aplication.css")
css_file.select_css(["avatar", "some-class"])
css_file.save_select_css
```
create a output.css contain only css clases "avatar" or "some-class"
