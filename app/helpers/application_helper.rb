module ApplicationHelper
  def date_BR(date)
    date.strftime("%d/%m/%Y")
  end

  def ambient_rails
    Rails.env == 'development' ? "Desenvolvimento..." : "Produção!"
  end



end
