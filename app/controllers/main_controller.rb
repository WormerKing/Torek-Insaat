class MainController < ApplicationController
	def faaliyet_raporu_pdf
		@year = params[:year].to_i
		send_file(
	    	"#{Rails.root}/public/faaliyet-raporu.pdf",
	    	filename: "faaliyet-raporu-#{@year}.pdf",
	    	type: "application/pdf"
	  	)
	end
end