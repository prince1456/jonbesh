<hr class="featurette-divider">

<p id="notice"><%= notice %></p>

<h1>Pics</h1>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Image</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @pics.each do |pic| %>
      <tr>
        <td><%= pic.title %></td>
        <td><%= pic.image %></td>
        <td><%= link_to 'Show', pic %></td>
        <td><%= link_to 'Edit', edit_pic_path(pic) %></td>
        <td><%= link_to 'Destroy', pic, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>
