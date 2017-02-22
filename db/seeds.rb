Category.create!([
  {title: "Hotels"},
  {title: "Lakes"},
  {title: "Parks"},
  {title: "Museums"}
])
Destination.create!([
  {name: "Lake Kivu", description: "Lake Kivu is the largest lake here in Rwanda", user_id: 1, region_id: 4, category_id: 2},
  {name: "Serena Hotel", description: "Serena is the most popular hotel that can be found in the Western Province of Rwanda", user_id: 1, region_id: 4, category_id: 1}
])
Image.create!([
  {url: "https://www.google.rw/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwiWnr_g4J7SAhUCPxoKHQybBbEQjBwIBA&url=http%3A%2F%2Fwww.newsofrwanda.com%", destination_id: 1},
  {url: "https://farm6.staticflickr.com/5715/23422976220_5e1a0d6919_b.jpg", destination_id: 1},
  {url: "https://www.google.rw/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwiIzfm-457SAhWCfxoKHUP-BLEQjBwIBA&url=http%3A%2F%2Fwww.abercrombiekent.co.uk%2Frwanda%2Flakekivu%2Fimages%2FAfrica-Rwanda-Lake-Kivu.jpg&psig=AFQjCNFDvOqzNta-EEHVCki7SufaJhCSPw&ust=1487682377199066", destination_id: 1},
  {url: "https://www.google.rw/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwi06Nvq457SAhVLfhoKHaG7DLEQjBwIBA&url=http%3A%2F%2Fwww.serenahotels.com%2Fd%2Fserenalakekivu%2Fmedia%2F__thumbs_600_500_scale%2F_CGC7148.jpg&psig=AFQjCNF1M60g4gp7TSXn-Xjq4Pdzbn1cdQ&ust=1487683679323774", destination_id: 2},
  {url: "https://lucymbabazi.files.wordpress.com/2015/06/kigali-rooms.jpg", destination_id: 2}
])
Region.create!([
  {name: "Northern Province"},
  {name: "Southern Province"},
  {name: "Eastern Province"},
  {name: "Western Province"},
  {name: "Kigali City"}
])
