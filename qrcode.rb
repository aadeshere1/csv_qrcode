require 'rqrcode'
require 'csv'
CSV.foreach('data.csv') do |row|
  qr = RQRCode::QRCode.new("Id:#{row[0]}\nCompany: #{row[1]}\nAddress: #{row[2]}\nName: #{row[3]}\nDesignation: #{row[4]}\nMobile no: #{row[5]}\nPhone no: #{row[6]}\nEmail: #{row[7]}\nWebsite: #{row[9]}\n\n\n\n\nPowered by Techrise")
  puts "Writing data..."
  png = qr.as_png(resize_gte_to: false, resize_exactly_to: false, fill: 'white', color: 'black', size: 120, border_modules: 4, module_px_size: 6, file: nil)
  puts "Saving as #{row[0]}_#{row[3].split(" ").join("-") unless row[3].nil?}.png"
  IO.write("#{row[0]}_#{row[3].split(" ").join("-") unless row[3].nil?}.png", png.to_s)
end
