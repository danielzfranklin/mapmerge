defmodule Mapmerge.TmpDir do
  def tmp_dir do
    dir = "#{System.tmp_dir!()}/mapmerge"
    if not File.exists?(dir), do: File.mkdir_p(dir)
    dir
  end
end
