shopping = [
    { "1 dozen", "eggs" },
    { "1 ripe", "melon" },
    { "4", "apples" },
    { "2 boxes", "tea" },
]
template = """
     quantity | item
     -------------------
<%= for {a, b} <- shopping do %> <%= String.pad_leading(a, 12) %> | <%= b %>\n<% end %>
"""

IO.puts EEx.eval_string(template, shopping: shopping, trim: true)

