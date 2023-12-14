class BizdenHaberlerController < ApplicationController
	before_action :authenticate_admin!

	def ekle
		@haber = BizdenHaberler.new
	end

	def ekle_post
		@haber = BizdenHaberler.new(params.require(:bizden_haberler).permit(:header,:body,:source))
		@haber.image = ""

		puts "#"*1000
		puts params.require(:bizden_haberler)

		if @haber.save
			flash[:notice] = "Haber başarıyla kaydedildi"
			redirect_to "/"
		else
			flash[:error] = "Haber oluşturmada hata meydana geldi"
			render :ekle
		end
	end
end
