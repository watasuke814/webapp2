class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(
      id: params[:id],
      title: params[:title],
      content: params[:content]
  )

    if params[:image]
      @name = params[:image].original_filename
      #image_nameの名前をデータベースに保存
      @post.image_name = "#{@name}"
       #投稿した画像を保存
      image = params[:image]
      File.binwrite("public/pic_images/#{@post.image_name}", image.read)
    end

  	if @post.save
  	  flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
end
