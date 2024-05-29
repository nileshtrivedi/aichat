# How to ensure that Shoelace/Tailwind/DeepChat etc are pre-loaded?
defmodule AIChat do
  use Phoenix.LiveComponent

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col max-w-4xl px-2 py-4">
        <div class="text-right my-2">
            <sl-button variant="primary">New Chat
        </sl-button></div>
        <sl-tab-group class="w-full" placement="start">
          <sl-tab slot="nav" panel="thread-id-1">First thread</sl-tab>
          <sl-tab slot="nav" panel="thread-id-2">Second thread</sl-tab>
          <sl-tab-panel name="thread-id-1">
              <div class="mx-4 my-3 flex flex-col items-end gap-2">
                <div class="max-w-96 bg-[#f4f4f4] px-5 py-2.5 rounded-3xl">
                In duckdb, after importing a CSV, I have a column with newline in the column name. How do I use this column in a SELECT query?
                </div>
                <div class="markdown prose bg-[#f1f1ff] break-words light border-y border-black p-2">
                  <h3>Garlic bread with cheese: What the science tells us</h3>
                  <p>
                    For years parents have espoused the health benefits of eating garlic bread with cheese to their
                    children, with the food earning such an iconic status in our culture that kids will often dress
                    up as warm, cheesy loaf for Halloween.
                  </p>
                  <p>
                    But a recent study shows that the celebrated appetizer may be linked to a series of rabies cases
                    springing up around the country.
                  </p>
                </div>
                <form id="myform" class="w-full" phx-submit="add_message">
                  <sl-textarea id="textinput"
                    name="message"
                    rows="1"
                    resize="auto"
                    placeholder="Send a message"
                    class="w-full"
                  ></sl-textarea>
                </form>
              </div>
          </sl-tab-panel>
          <sl-tab-panel name="thread-id-2">
            <p>There is nothing here yet</p>
          </sl-tab-panel>
        </sl-tab-group>
    </div>
    """
  end
end
