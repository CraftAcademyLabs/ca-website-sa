module GraduatesHelper
  def find_graduates(category = nil)
    if category
      find_graduates_by(category)
    else
      graduates
    end
  end

  def find_en_graduates
    en_graduates
  end

  def next_graduate(current_graduate)
    index = graduates.find_index { |graduate| graduate == current_graduate }
    graduates[index.next % graduates.count]
  end

  def next_en_graduate(current_graduate)
    index = en_graduates.find_index { |graduate| graduate == current_graduate }
    en_graduates[index.next % en_graduates.count]
  end

  private

  def find_graduates_by(category)
    graduates.select do |graduate|
      graduate['categories'] && graduate['categories'].include?(category)
    end
  end

  def find_en_graduates_by(category)
    en_graduates.select do |graduate|
      graduate['categories'] && graduate['categories'].include?(category)
    end
  end

  def graduates
    data.graduates
  end

  def en_graduates
    data.graduates_en
  end

end
