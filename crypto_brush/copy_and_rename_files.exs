defmodule CopyRenameFiles do
  import File, only: [cp: 2]
  import Path, only: [extname: 1, basename: 1, join: 2]

  @old_new_names %{
    "btc" => "Bitcoin(BTC)",
    "eth" => "Ethereum(ETH)",
    "usdt" => "TetherUSDt(USDT)",
    "bnb" => "BinanceCoin(BNB)",
    "xrp" => "XRP(XRP)",
    "usdc" => "USDCoin(USDC)",
    "sol" => "Solana(SOL)",
    "ada" => "Cardano(ADA)",
    "doge" => "Dogecoin(DOGE)",
    "ton" => "Toncoin(TON)",
    "trx" => "TRON(TRX)",
    "link" => "Chainlink(LINK)",
    "matic" => "Polygon(MATIC)",
    "dot" => "Polkadot(DOT)",
    "wbtc" => "WrappedBitcoin(WBTC)",
    "ltc" => "Litecoin(LTC)",
    "dai" => "Dai(DAI)",
    "shib" => "ShibaInu(SHIB)",
    "bch" => "BitcoinCash(BCH)",
    "avax" => "Avalanche(AVAX)",
    "leo" => "UNUSSEDLEO(LEO)",
    "xlm" => "Stellar(XLM)",
    "tusd" => "TrueUSD(TUSD)",
    "cosmos" => "Cosmos(ATOM)",
    "okb" => "OKB(OKB)",
    "uni" => "Uniswap(UNI)",
    "xmr" => "Monero(XMR)",
    "etc" => "EthereumClassic(ETC)",
    "cro" => "Cronos(CRO)",
    "fil" => "Filecoin(FIL)",
    "hbar" => "Hedera(HBAR)",
    "busd" => "BinanceUSD(BUSD)",
    "icp" => "InternetComputer(ICP)",
    "apt" => "Aptos(APT)",
    "ldo" => "LidoDAO(LDO)",
    "vet" => "VeChain(VET)",
    "inj" => "Injective(INJ)",
    "aave" => "Aave(AAVE)",
    "arb" => "Arbitrum(ARB)",
    "mnt" => "Mantle(MNT)",
    "op" => "Optimism(OP)",
    "mkr" => "Maker(MKR)",
    "qnt" => "Quant(QNT)",
    "grt" => "TheGraph(GRT)",
    "rune" => "THORChain(RUNE)",
    "egld" => "MultiversX(EGDL)",
    "imx" => "ImmutableX(IMX)",
    "algo" => "Algorand(ALGO)",
    "stx" => "Stacks(STX)",
    "bsv" => "BitcoinSV(BSV)",
    "rndr" => "Render(RNDR)",
    "neo" => "Neo(NEO)",
    "axs" => "AxieInfinity(AXS)",
    "theta" => "ThetaNetwork(THETA)",
    "xtz" => "Tezos(XTZ)",
    "mana" => "Decentraland(MANA)",
    "eos" => "EOS(EOS)",
    "fmt" => "Fantom(FMT)",
    "bgb" => "BitgetToken(BGB)",
    "flow" => "Flow(FLOW)",
    "iota" => "IOTA(IOTA)",
    "ape" => "ApeCoin(APE)",
    "pepe" => "PepeCoin(PEPE)",
    "zec" => "Zcash(ZEC)",
    "cspr" => "Casper(CSPR)",
    "btt" => "BitTorrent(BTT)",
    "comp" => "Compound(COMP)",
    "1inch" => "1inchNetwork(1INCH)",
    "nexo" => "Nexo(NEXO)",
    "ht" => "HuobiToken(HT)",
    "gt" => "GateToken(GT)",
    "fxs" => "FraxShare(FXS)",
    "paxg" => "PAXGold(PAXG)",
    "woo" => "WOONetwork(WOO)",
    "mina" => "Mina(MINA)",
    "chz" => "Chiliz(CHZ)",
    "cfx" => "Conflux(CFX)",
    "xec" => "eCash(XEC)",
    "gala" => "Gala(GALA)",
    "lunc" => "TerraClassic(LUNC)"
  }
  def copy_and_rename_png_files(source_dir, destination_dir) do
    source_dir
    |> File.ls!()
    |> Enum.filter(
      &(extname(&1) == ".png" &&
          Map.has_key?(@old_new_names, String.trim_trailing(basename(&1), ".png")))
    )
    |> Enum.map(fn file ->
      source_path = join(source_dir, file)
      key = String.trim_trailing(basename(file), ".png")
      new_name = @old_new_names[key] <> ".png"
      destination_path = join(destination_dir, new_name)

      cp(source_path, destination_path)
      destination_path
    end)
  end

  def run do
    source_directory = "/Users/isavita/git/cryptocurrency-icons/128/color"
    destination_directory = "#{File.cwd!()}/128/color"
    copied_files = copy_and_rename_png_files(source_directory, destination_directory)

    Enum.each(copied_files, &IO.puts(&1))
  end
end

CopyRenameFiles.run()
