defmodule DiscussWeb.TopicLive do
alias Discuss.{Topics, Topics.Topic}

use DiscussWeb, :live_view
   def mount(_params, _session, socket) do
#if connected?(socket) do
form = 
%Topic{}
|> Topic.changeset(%{})
|> to_form(as: "topic")
socket = 
socket
|> assign(form: form)
    {:ok, socket}
   # else
#{:ok, assign(socket, loading: true)}
 # end
end 


def handle_event("validate", %{"topic" => params}, socket) do
changeset = 
       %Topic{}
       |> Topics.change_topic(params)
       |> Map.put(:action, :validate)
            {:noreply, assign(socket, :form, to_form(changeset))}

end


#new function for loading
#def render(%{loading: true} = assigns) do
#~H"""
#Discuss is bringing on the topics....
#"""
#end


def handle_event("create", %{"topic" => params}, socket) do
params
|> Topics.create_topic()
|> case do 
{:ok, _topic} ->
socket = 
socket
|> put_flash(:info, "Topic created successfully")
|> push_navigate(to: ~p"/")

{:noreply, socket}

{:error, changeset} ->
socket = 
socket 
|> put_flash(:error, "Error creating Topic")
|> push_navigate(to: ~p"/topics/new")
{:noreply, socket}
end 
end

end