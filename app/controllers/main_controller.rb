class MainController < ApplicationController
	def faaliyet_raporu_pdf
		@year = params[:year].to_i
		send_file(
	    	"#{Rails.root}/public/faaliyet-raporu.pdf",
	    	filename: "faaliyet-raporu-#{@year}.pdf",
	    	type: "application/pdf"
	  	)
	end
	def calisan_adayi_aydinlatma_metni_pdf
		send_file(
	    	"#{Rails.root}/public/calisan-adayi-aydinlatma-metni.pdf",
	    	filename: "calisan-adayi-aydinlatma-metni.pdf",
	    	type: "application/pdf"
	  	)
	end

	def bizden_haberler
		@bizden_haberler = BizdenHaberler.all
	end
	
	def basindan_haberler
		@basindan_haberler = BasindanHaberler.all
	end
end