defmodule DiscussWeb.AuthLive do 
use DiscussWeb, :live_view
#plug Ueberauth

def mount(_params,_session, socket)do
{:ok, assign(socket, name: "ijeoma")}
end
def render(assigns) do
~H"""
<h1>hello</h1>
"""
end


end