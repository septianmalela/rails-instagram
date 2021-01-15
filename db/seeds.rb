# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create tabel user
# rails g model User name:string email:string
# # create tabel Post
# rails g model Post user_id:integer title:string content:string
# # create table Comment
# rails g model Comment post_id:integer user_id:integer comment:string
# # create table Like
# rails g model Like post_id:integer user_id:integer
# # create table Following
# rails g model Following follower_id:integer user_id:integer
# # create table AttachmentPost
# rails g model AttachmentPost post_id:integer foto:string
# # membuat database
# rake db:create
# # migrate tabel ke database
# rake db:migrate
# # membuat record User

rake db:migrate:reset

u1 = User.create
u1.name = "septian"
u1.email = "maulanas430@gmail.com"
u1.save

u2 = User.create
u2.name = "yusup"
u2.email = "yusup@gmail.com"
u2.save

u3 = User.create
u3.name = "megumi"
u3.email = "megumi@gmail.com"
u3.save

u4 = User.create
u4.name = "tonapa"
u4.email = "tonapa@gmail.com"
u4.save

# membuat post kedua dengan user_id = 1
post1 = u1.posts.create(title: "Percobaan Pertama", content: "Ini adalah percobaan pertama yang emang harus di coba")
post1.save

# membuat post kedua dengan user_id = 2
post2 = u2.posts.create(title: "Percobaan Kedua", content: "Ini Adalah percobaan kedua dengan user yang id nya 2")
post2.save

# membuat post pertama dengan user_id = 3
post3 = u3.posts.create(title:"percoban ketiga", content: "ini adlaha percobaan yangketiga")
post3.save

# membuat post pertama dengan user_id = 4
post4 = u4.posts.create(title: "ini percobaan keempat", content: "Ini adlah percobaan yang keempat")
post4.save

# membuat attachment_post dengan post_id = 1
attachment_post1 = post1.attachment_posts.create(foto: "percobaan.png")
attachment_post1.save

# membuat attachment_post dengan post_id = 2
attachment_post2 = post2.attachment_posts.create(foto: "percobaankedua.png")
attachment_post2.save

# membuat attachment_post dengan post_id = 3
attachment_post3 = post3.attachment_posts.create(foto: "percobaan.png")
attachment_post3.save

# membuat attachment_post dengan post_id = 4
attachment_post4 = post4.attachment_posts.create(foto: "percobaan.png")
attachment_post4.save

# membuat like dengan post_id 1 dan user_id 1
like1 = post1.likes.create(user_id: u1.id)
like1.save

# membuat like dengan post_id 2 dan user_id 2
like2 = post2.likes.create(user_id: u2.id)
like2.save

# membuat like dengan post_id 3 dan user_id 3
like3 = post3.likes.create(user_id: u3.id)
like3.save

# membuat like dengan post_id 4 dan user_id 4
like4 = post4.likes.create(user_id: u4.id)
like4.save

# membuat follower user_1 follow user_id 2/ septian follow yusup
followings1 = u1.followings.create(follower_id: u2.id)
followings1.save

# membut user_id 2 followback user_id/ yusup followback septian
followings2 = u2.followings.create(follower_id: u1.id)
followings2.save

# membuat follower user_id 3 follow user_id 4/ megumi follow tonapa
followings3 = u3.followings.create(follower_id: u4.id)
followings3.save

# membut user_id 4 followback user_id 3/ tonapa followback megumi
followings4 = u4.followings.create(follower_id: u3.id)
followings4.save

# membuat comment dengan post_id 1 dan user_id 1
comment1 = post1.comments.create(user_id: u1.id, comment: "Ini comment pertama okayyy")
comment1.save

# membuat comment dengan post_id 2 dan user_id 2
comment2 = post2.comments.create(user_id: u2.id, comment: "Ini comment kedua yaaa")
comment2.save

# membuat comment dengan post_id 3 dan user_id 3
comment3 = post3.comments.create(user_id: u3.id, comment: "ini comment ketiga")
comment3.save

# membuat comment dengan post_id 4 dan user_id 4
comment4 = post4.comments.create(user_id: u4.id, comment: "ini comment keempat")
comment4.save

# show post yang diubat oleh user_id
post = u1.posts

# get data following
following = u1.followings

# get data follower
follower = Following.where(follower_id: u1.id)