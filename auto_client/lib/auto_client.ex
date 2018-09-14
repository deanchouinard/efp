defmodule AutoClient do
  
  defdelegate start(), to: AutoClient.Interact

end
