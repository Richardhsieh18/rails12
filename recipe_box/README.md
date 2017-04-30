Nested Form
    gem "cocoon"

image transform when hover
    img {
      width: 100%;
      -webkit-transition: all .3s ease-out;
      -moz-transition: all .3s ease-out;
      -o-transition: all .3s ease-out;
       transition: all .3s ease-out;
      &:hover {
        transform: scale(1.075);
      }
    }

link_to with image_tag
    <%= link_to r do %>
    <%= image_tag r.image.url(:medium)%>
    <% end %>
