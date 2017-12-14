class Ogrenci{
	var ad: String, soyad: String, dönem: String, cinsiyet: String

	init(ad:String, soyad:String, dönem: String, cinsiyet: String){
		self.ad = ad
		self.soyad = soyad
		self.dönem = dönem
		self.cinsiyet = cinsiyet
	}

	func MetineDönüştür() -> String {
		let str = ad + " " + soyad + " " + cinsiyet + " " + dönem
		return str
	}

}
