import CSV
import Foundation
class Okul {

  var Ogrenciler: [Ogrenci] = []

  init(){
    Dosyaoku()
  }

  func Dosyaoku(){
    var Ogrİsimler: [String] = []
    let stream = InputStream(fileAtPath: "/home/ebru/isimler.csv")!
    let csv = try! CSVReader(stream: stream)
    while let row = csv.next() {
        let ogrenci = Ogrenci(ad: "\(row[0])", soyad: "\(row[1])", dönem: "\(row[2])", cinsiyet: "\(row[3])")
        if Ogrİsimler.contains(ogrenci.ad){
          print("Çakışma var")
          exit(0)
        }
        else{
          Ogrİsimler.append(ogrenci.ad)
          Ogrenciler.append(ogrenci)
        }
    }
  }

  func TumÖğrencileriYazdir() -> Array<Ogrenci> {
    return Ogrenciler
  }


  func CinsiyetYazdir(cinsiyet: String) -> Array<Ogrenci> {
    var OgrenciCins: [Ogrenci] = []
    if cinsiyet == "e" || cinsiyet == "E"{
      for ogrenci in Ogrenciler{
        if ogrenci.cinsiyet=="e"||ogrenci.cinsiyet=="E"{
            OgrenciCins.append(ogrenci)
        }
      }
    }
    else if cinsiyet == "k" || cinsiyet == "K" {
      for ogrenci in Ogrenciler{
        if ogrenci.cinsiyet == "k" || ogrenci.cinsiyet == "K" {
            OgrenciCins.append(ogrenci)
        }
      }
    }
    return OgrenciCins
  }

  func DevresiniYazdir(dönem: String) -> Array<Ogrenci> {
    var OgrenciCins: [Ogrenci] = []
    if dönem=="1" || dönem == "2" || dönem == "3" || dönem == "4"{
      for ogrenci in Ogrenciler {
        if ogrenci.dönem == dönem {
          OgrenciCins.append(ogrenci)
        }
      }
    }
    return OgrenciCins
  }

  func ÖğrenciListeYazdir(Ogrenciler: Array<Ogrenci>) {
    for ogrenci in Ogrenciler{
      print(ogrenci.MetineDönüştür())
    }
  }


  func main(argümanlar: [String]) -> String {

    if argümanlar.count > 1 {
      //print("Hata, Sadece bir argüman girebilirsiniz!")
      return "Hata, Sadece bir argüman girebilirsiniz!"
    }
    else if argümanlar == []{
      okul.ÖğrenciListeYazdir(Ogrenciler: okul.TumÖğrencileriYazdir())
    }
    else{
      let arg = argümanlar[0]
      if arg.count == 1 {
        if(Int(arg) != nil){
          let ogrlst = okul.DevresiniYazdir(dönem: arg)
          if !ogrlst.isEmpty{
            okul.ÖğrenciListeYazdir(Ogrenciler: ogrlst)
          }
          else{

            return "Lütfen 1 ile 4 aralığında bir sayı giriniz"
          }
        }
        else{
          let ogrlst = okul.CinsiyetYazdir(cinsiyet: arg)
          if !ogrlst.isEmpty{
            okul.ÖğrenciListeYazdir(Ogrenciler: ogrlst)
          }
          else{
            //print("Hatalı Argüman girdiniz")
            return "Hatalı Argüman girdiniz"
          }
        }
      }
      else{
        //print("Tanınmayan argüman: " + arg)
        return "Tanınmayan argüman: " + arg
      }
    }
    return "İşlem Başarılı!"
  }
}

let okul = Okul()
var args = CommandLine.arguments
args.remove(at: 0)
print(okul.main(argümanlar: args))
