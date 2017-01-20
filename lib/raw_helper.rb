module RawHelper
  def raw(partial)
    file = load_partial(partial)
    contents = file.read
    file.close

    contents
  end

  private

  def load_partial(partial)
    File.open(File.join(config[:source], partial), "r")
  end
end