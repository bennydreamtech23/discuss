defmodule DiscussWeb.EditLive do
  alias Discuss.{Topics, Topics.Topic}

  use DiscussWeb, :live_view
def mount(_params, _session, socket) do
form =
%Topic{}
|> Topic.changeset(%{})
|> to_form(as: "topic")
socket =
socket
|> assign(form: form)
{:ok, socket}

end



def handle_event("edit", %{"id" => topic_id}, socket) do
topic_id
|> Topics.get_topic()
|> Topics.change_topic
#|> Topics.update_topic
{:noreply, socket}
 end

end