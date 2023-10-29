defmodule DiscussWeb.TopicsLive do
alias Discuss.{Topics, Topics.Topic}

use DiscussWeb, :live_view
   
   def mount(_params, _session, socket) do
socket =
socket
|> stream(:topics, Topics.list_topics())
    {:ok, socket}
  end

def handle_event("delete ", %{"id" => topic_id}, socket) do
topic_id
|> Topics.get_topic!(String.to_integer(topic_id))
|> Topics.delete_topic()
|> case do
{:ok, _topic} ->
socket =
socket
|> put_flash(:info, "Topic deleted successfully")
|> push_navigate(to: ~p"/")
{:noreply, socket}

{:error, changeset} ->
socket =
socket
|> put_flash(:error, "Error occured while deleting")
{:noreply, socket}
end
end

end