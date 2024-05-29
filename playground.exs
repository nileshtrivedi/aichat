defmodule MyLayout do
  use Phoenix.Component
  def render("live.html", assigns) do
    ~H"""
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.15.0/cdn/themes/light.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.15.0/cdn/shoelace-autoloader.js"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,container-queries"></script>

    <script>
    document.addEventListener("DOMContentLoaded", (event) => {
      const textarea = document.querySelector('sl-textarea');
      textarea.addEventListener('keydown', event => {
        if (event.key === 'Enter' && !event.shiftKey) {
          // console.log("Enter pressed");
          event.preventDefault();
          let form = document.getElementById('myform');
          console.log(form);
          // form.dispatchEvent(new Event('submit', {bubbles: true, cancelable: true}));
          form.submit();
        }
      });
    });
    </script>
    <%= @inner_content %>
    """
  end
end

defmodule DemoLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, socket, layout: {MyLayout, :live}}
  end

  def render(assigns) do
    ~H"""
    <.live_component module={AIChat} id="aichat" />
    """
  end


end

PhoenixPlayground.start(live: DemoLive)
