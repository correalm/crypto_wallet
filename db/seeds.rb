# create! -> Indica ao rails que devem ser logados quaisquer erros
coins = [
  {
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Imagem-Dinheiro-Bitcoin-PNG.png"
  },
  {
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Imagem-Dinheiro-Bitcoin-PNG.png"  
  },
  {
    description: "Dash",
    acronym: "DASH",
    url_image: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Imagem-Dinheiro-Bitcoin-PNG.png"  
  },
  {
    description: "Zcash",
    acronym: "ZEC",
    url_image: "https://z.cash/wp-content/uploads/2020/03/zcash-icon-fullcolor.png"
  }
]

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

# Com esse método garanto que não haverá duplicação dos dados
coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

mining_types.each do |type|
  MiningType.find_or_create_by!(type)
end