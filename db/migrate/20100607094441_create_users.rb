class CreateUsers < ActiveRecord::Migration
  def self.up
    
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.date :dob
      t.integer :age
      t.boolean :gender
      t.string :mobile 
      t.text :address
      t.binary :photo        
      t.string :role,         :default => "others"
      t.integer :order_by
      t.string :relationship
      t.string :comment,      :default => "No feedback"
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end
#    say "hello"
#    User.create :username => "prabu",:name=>"prabu", :email => "d.prabhu2007@gmail.com", :age => 25, :dob => "1985-07-17", :mobile=>"9952846011",:gender=>true,:address => "7/11, Gandhistreet, Bommanpatti, Kavandapadi(po),Erode-628455.", :role => "admin",:order_by=>1, :relationship=>"myself",:comment=>nil, :password_hash => "67990a9dfb3dc9785b891dc80413091896607f21", :password_salt => "ef5d24c5ecced0b2e561770b6a92d46a24b572b7"
#    
#    User.create :username => "ChandruN",:name=>"Chandrasekaran", :email => "chandrasekaran91@yahoo.com", :age => "25", :dob => "1985-05-07",:mobile=>"9944550571",:gender=>true,:address => "15/8, PRAYAG APARTMENT, 23, 2ND FLOOR, GANDHI NAGAR, 1ST MAIN ROAD, ADAYAR, CHENNAI-20", :relationship=>"friend",:comment=>"BHC",:order_by=>"2", :password_hash => "aae214ca78dfc7627ababaf736fe35c17511125a", :password_salt => "9e0923cc5aa7aecf658756a9a4a707fdae1ae83a"
#    
#    User.create :username => "MuthuBose", :name=>"Muthukumaramani", :email => "muthukumaramanis@hcl.in", :gender=>true,:relationship=>"friend",:order_by=>"3", :password_hash => "d51527f676f0864de376f336a928d4e20f2a607f", :password_salt => "a125052b2f8a17a88b8a1d29864f4d5a7c46e43e"
#   
#    User.create :username => "prasadinjoy", :name=>"Prasad",:email => "bushinjoy@gmail.com", :gender=>true,:relationship=>"friend",:order_by=>"4", :password_hash => "c565c3addd035930838487981d7a36eebb9d7d58", :password_salt => "b9a43d85e3f31453de177ef5dad73d129ba6c7c1" 
#   
#    User.create :username => "suresh", :email => "d.suresheee@gmail.com", :age => "24", :dob => "1986-08-11",:mobile=>"9994706970",:gender=>true,:address => "7/11, Gandhistreet, Bommanpatti, Kavandapadi(po),Erode-628455.", :relationship=>"brother",:order_by=>"6", :password_hash => "5f90776388b917fa84c63df6dc7cf2c43d6aa428", :password_salt => "d58643c5c53f837d4b01620b45a0e3c97bc7d33a"
#   
#    User.create :username => "balaji", :email => "balako35@yahoo.co.in", :age=>"17", :dob => "1993-10-28",:mobile=>"9442763263",:gender=>true,:address => "202/114-7 valzhavalamudamkasakarnoor salem.", :relationship=>"His Mapla",:order_by=>"7", :password_hash => "ff583cf6f21d9a38662ca831b858fe1693fbb829", :password_salt => "08e2556f559c56a0078406f1079941d1621c154b"
#  
#    User.create :username => "sri", :email => "rajii1950@yahoo.co.in", :order_by=>"5", :password_hash => "675ef8dd2aa412d6507a7b0c39536e6ac884a954", :password_salt => "7a82283c0879f102c5c00c7e4b01fc237ac44606"
#    say "hello end"
  end
  
  def self.down
    drop_table :users
  end
end
