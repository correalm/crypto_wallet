namespace :dev do
  desc "Config the development enviroment"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner("Config setup") do
        %x(rails db:drop db:create db:migrate)
        # Aqui é fundamental cuidar a ordem de criação
        %x(rails dev:add_types)
        %x(rails dev:add_coins)
      end

    else
      puts "Need development enviroment"
    end
  end

  desc "Add new types"
  task add_types: :environment do
    mining_types = [
      {
        description: "Proof of Work",
        acronym: "PoW"
      },
      {
        description: "Proof of Stake",
        acronym: "PoS" 
      },
      {
        description: "Proof of Capacity",
        acronym: "PoC"
      }
    ]
    mining_types.each do |type|
      MiningType.find_or_create_by!(type)
    end
  end

  desc "Add new Coins"
  task add_coins: :environment do 
    coins = [
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Imagem-Dinheiro-Bitcoin-PNG.png",
        mining_type: MiningType.find_by(acronym: "PoW")
      },
      {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Imagem-Dinheiro-Bitcoin-PNG.png",  
        mining_type: MiningType.first
      },
      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Imagem-Dinheiro-Bitcoin-PNG.png",  
        mining_type: MiningType.last
      },
      {
        description: "Zcash",
        acronym: "ZEC",
        url_image: "https://z.cash/wp-content/uploads/2020/03/zcash-icon-fullcolor.png",
        mining_type: MiningType.all.sample
      }
    ]

    coins.each do |coin|
      Coin.find_or_create_by!(coin)
    end
  end



  private
  # yield define a possibilidade de colocar um bloco de código ali no meio
  def show_spinner(msg)
    spinner = TTY::Spinner.new("[:spinner] #{msg}")
    spinner.auto_spin
    yield 
    spinner.success('(successful)')
  end
end
