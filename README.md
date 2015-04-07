h1. SpreeSlider

Add a slider to the homepage of your Spree site, and manage the slideshow from within the Admin panel.

h2. Installation

To install, add spree_slider to your @Gemfile@ and run `bundle install`:

```
gem 'spree_slider', github: 'spree-contrib/spree_slider'
```

Then install and run the migrations to add the tables:
```
bundle exec rake railties:install:migrations
bundle exec rake db:migrate
```

This extension comes with three sliders plugins: Nivo, SimpleCarousel and Anything slider
Depending on which plugin you want to install, run the following command:

h3. Anything slider

```
rails generate spree_slider:install_anything
```

h3. SimpleCarousel slider

```
rails generate spree_slider:install_simple_carousel
```

h3. Nivo slider

```
rails generate spree_slider:install_nivo
```

The slider is almost unstyled. To customize you have to add your own css and
eventually modify the partial copied into your app folder:
app/views/spree/shared/_slider.html.erb

h3. Or Roll your own!

You may want to theme your site your own way.  If you want to include your own library such Bootstrap or Foundation.
Just add your own to your asset pipeline, and update your theme templates with appropriate markup.  Example:

```erb
<% if Spree::Slide.published.count > 0 %>
  <section id="slideshow">
    <ul class="slide">
      <% Spree::Slide.published.order('position ASC').each do |s| %>
        <li>
          <h1><%= s.slide_name %></h1>
          <%= link_to image_tag(s.slide_image.url), url_for(s.slide_link) %>
        </li>
      <% end %>
    </ul>
    <a title="<%= t(:previous) %>" class="slider-prev"><%= t(:previous)%></a>
    <a title="<%= t(:next) %>" class="slider-next"><%= t(:next) %></a>
  </section>
<% end %>
```

h2. Dynamic content management

To add dynamic content, go to the spree admin section, under 'Configuration'
and find the Spree Slider menu. 

Copyright (c) 2012 "R.S.A.":http://www.rsaweb.com released under the New BSD License
