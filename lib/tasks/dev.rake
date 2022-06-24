namespace :dev do
  desc "Config the development enviroment"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner("Config setup") do
        %x(rails db:drop db:create db:migrate db:seed)
      end

    else
      puts "Need development enviroment"
    end
  end

  # yield define a possibilidade de colocar um bloco de código ali no meio
private
  def show_spinner(msg)
    spinner = TTY::Spinner.new("[:spinner] #{msg}")
    spinner.auto_spin
    yield 
    spinner.success('(successful)')
  end
end
