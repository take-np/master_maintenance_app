require 'byebug'
require 'csv'
require 'nkf'
class MastersController < ApplicationController
  def top
  end

  def search
  end

  def index
    @masters = Master.all.order(created_at: :desc)
  end

  def new
  end

  def register_csv
    # ================================
    # 文字コードの変更に対応する
    # shift-jis, utf-8
    # csv以外にはヴァリでーしょんかける
    # ================================
    if params[:upload]
      uploaded_data = params[:upload]
      @name = uploaded_data.original_filename
      # p uploaded_data.reaaad
      #================================
      # w'b'と指定することで、バイナリモードで開いている。
      #'W'だけの場合、["\x82" from ASCII-8BIT to UTF-8]のエラー
      #ASCII-8BITにしか無い文字列を、UTF-(に変換しようとしているとのエラー)
      #'t' にて改行文字を、/nに指定
      #================================
      # new_file = CSV.open(Rails.root.join('public/csv/' + @name), 'w')
      # CSV.foreach(uploaded_data, encoding: "ASCII-8BIT:UTF-8") do |row|
      #   new_file.puts row
      # end
      # new_file.close
      
      File.open('public/csv/' + @name, 'wb') do |file|
        # file.set_encoding(“UTF-8”)
        data = uploaded_data.read
        p data
        file.write(data.encode('UTF-8', 'Shift_JIS'))
      end
      # byebug
      # File.write('public/csv/' + @name, uploaded_data.read, :encoding => Encoding::CP932)

      @master = Master.new(
        file_name: @name,
        user_name: "test_user"
      )
      @master.save
      redirect_to('/masters/new')
    else
      flash[:notice] = "ファイルが選択されていません"
      redirect_to('/masters/new')

      # [] = "アップロードするFileを選択してください"
    end
      
  end
  
  def new
  end
  def detail
    @master = Master.find_by(id: params[:id])
    @master_file = File.read("public/csv/#{@master.file_name}")
    @csv_read = CSV.parse(@master_file, skip_blanks: true)
   # 別パターン
    # ================================
    # @master_file = File.read("public/csv/#{@master.file_name}", encoding: 'utf-8')
    # @master_file = @master_file.gsub /^$\n/, ' '
    # i = 0
    # @master_data = CSV.parse(@master_file, skip_blanks: true)
    # ================================
        # byebug
    #quote_char: 'quote_char', col_sep: 'splitter')

  end

  def edit_masters
    # @master = 
  end

  def approval_change
  end

end
