module PossessiveHelper
  def possessivize(string)
    return "#{string}'" if last_character(string) == "s"
    "#{string}'s"
  end

  def possessivize_se(string)
    return "#{string}'" if last_character(string) == "s"
    "#{string}s"
  end

  private

  def last_character(string)
    string[-1, 1]
  end
end