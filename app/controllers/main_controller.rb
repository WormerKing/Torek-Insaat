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
	def tahmini_maliyet_hesaplama
		flash[:isim] = "aquame"
	end
	def tahmini_maliyet_hesaplama_post
		puts "#"*1000
		puts "Wormer"
		flash[:isim] = "Wormer"
		render(template:"main/tahmini_maliyet_hesaplama_post")
	end

	def devam_eden_projeler
		@projects = Project.where('status = ?','devam-eden-proje').each_slice(3).to_a
	end
	def tamamlanan_projeler
		@projects = Project.where('status = ?','tamamlanan-proje').each_slice(3).to_a
	end

	# FIXME navbar kısmı mobilde düzgün çalışmıyor
end