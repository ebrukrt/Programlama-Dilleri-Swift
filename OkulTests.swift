import XCTest
@testable import Okul

class OkulTests: XCTestCase {
  let okul = Okul()

    func testDosyaOku() {
        XCTAssertEqual(okul.Dosyaoku().description, "")
    }
    func testCinsiyetYazdir() {
        XCTAssertEqual(okul.CinsiyetYazdir(cinsiyet: "e").description, "[]")
    }
    func testDevresiniYazdir() {
        XCTAssertEqual(okul.DevresiniYazdir(dönem: "5").description, "[]")
    }
    func testTumOgrencileriYazdir() {
        XCTAssertNotNil(okul.TumÖğrencileriYazdir())

    }
    func testArguman1() {
        XCTAssertEqual(okul.main(argümanlar: ["5", "42"]).description, "Hata, Sadece bir argüman girebilirsiniz!")
    }
    func testArguman2() {
        XCTAssertEqual(okul.main(argümanlar: ["5"]).description, "Lütfen 1 ile 4 aralığında bir sayı giriniz")
    }
    func testArguman3() {
        XCTAssertEqual(okul.main(argümanlar: ["y"]).description, "Hatalı Argüman girdiniz")
    }
    func testArguman4() {
        XCTAssertEqual(okul.main(argümanlar: ["Erkek"]).description, "Tanınmayan argüman: " + "Erkek")
    }

    static var allTests = [
        ("testDosyaOku",testDosyaOku),
        ("testCinsiyetYazdir",testCinsiyetYazdir),
        ("testDevresiniYazdir",testDevresiniYazdir),
        ("testTumOgrencileriYazdir",testTumOgrencileriYazdir),
        ("testArguman1",testArguman1),
        ("testArguman2",testArguman2),
        ("testArguman3",testArguman3),
        ("testArguman4",testArguman4),
    ]
}
