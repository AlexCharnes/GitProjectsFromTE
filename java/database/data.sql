BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- INSERT brewery
INSERT INTO brewery (name, location, established_year, description, imageURL) VALUES
('Hoof Hearted Brewery and Kitchen', '850 N 4th St, Columbus, OH 43215', 2011, 'Quirky brewery & restaurant offering craft beers, inventive pub fare & a large patio.','https://images.squarespace-cdn.com/content/v1/530fa82ae4b059649e4b5d3c/1394423334322-L2RLZT2CSZEFC4S7XDTI/HHB_ROUND_flat_RGB.jpg?format=1500w'),
('Wolfs Ridge Brewing', '215 N 4th St, Columbus, OH 43215', 2013, 'Modern brewpub serving a range of craft beers & elevated pub fare in a sleek, industrial setting.', 'https://i0.wp.com/www.dublinarts.org/wp-content/uploads/2016/10/WRB-Element_02LogoWolf.png?fit=2400%2C2400&ssl=1'),
('Knotty Pine Brewing', '1765 W 3rd Ave, Columbus, OH 43212', 2017, 'Brewpub serving housemade craft beers & American eats in a cozy space with a woodsy vibe.', 'https://static.wixstatic.com/media/b93306_f58b3c10541643dfa32f2d78898e629a~mv2.png/v1/fill/w_76,h_79,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/b93306_f58b3c10541643dfa32f2d78898e629a~mv2.png'),
('Barley''s Brewing Company', '467 N High St, Columbus, OH 43215', 1992, 'Longtime brewpub serving housemade beers & classic pub fare in a cozy, brick-walled space.', 'https://popmenucloud.com/apxqvlfc/a2ee7f33-6b54-4193-b5c1-6da023bc3221.png'),
('Columbus Brewing Company', '2555 Harrison Rd, Columbus, OH 43204', 1988, 'Columbus Brewing Company is an independent craft brewery dedicated to exploring the flavors of American hops. Best known for Columbus IPA and Bodhi.', 'https://beerpulse.com/wp-content/uploads/2011/02/CBC_CMYK_square_burgandy_sm.png'),
('Olentangy River Brewing Company', '303 Green Meadows Dr S, Lewis Center, OH 43035', 2008, 'Olentangy River Brewing Company, nestled in Ohio, offers a vibrant array of handcrafted brews, reflecting the regions spirit and heritage, all within a welcoming and community-focused atmosphere.', 'https://images.squarespace-cdn.com/content/v1/6192e85d8c6bc27fc2530eec/473350b2-03fb-4fd4-855e-2783d465337c/Logo_Badge.png?format=1500w'),
('Thunderwing Brewing Company', '2419 Scioto Harper Dr, Columbus, OH 43204', 2023, 'Thunderwing Brewing is an American Craft brewery which is operating out of the west side of Columbus . Focusing on a wide variety of offerings, from light easy drinkers, to dark robust ales with plenty of hoppy options as well!', 'https://thunderwingbrewing.com/wp-content/uploads/2023/07/ThunderWing-Full-1.png'),
('Seventh Son Brewing Co', '1101 N 4th St, Columbus, OH 43201', 2013, 'Comfortable tap room and patio with a rotating schedule of food trucks. Since April of 2013 Seventh Son has brewed over 225 different beers and has been consistently voted Columbus best brewery', 'https://drinkupcolumbus.com/wp-content/uploads/2012/04/seventh-son.png' );

-- INSERT beer
INSERT INTO beer (name, brewery_id, style, abv, ibu, description, imageURL) VALUES
('60$ Nachos', 1, 'Double IPA', 8.0, 80, 'Intensely hoppy ale with a bold bitterness and tropical fruit flavors.', 'https://res.cloudinary.com/dknqgztin/image/upload/v1712679976/hoof_dipa_btjcru.jpg'),
('$120 Nachos', 1, 'Triple IPA', 12, 80, 'Triple Dry-Hopped Triple IPA with Citra Hops', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrMwJkNDn0fuzazejM-CsTPqY0DRsjIScDTvFiVeUtCQ&s'),
('Fitness Freak', 1, 'Berliner Weisse', 4.0, 5, 'Tart and refreshing wheat beer with a clean, crisp finish.', 'https://res.cloudinary.com/dknqgztin/image/upload/v1712679962/hoof_fake_beer_flsfg8.jpg'),
('Belloq', 1, 'Stout with Coffee and Vanilla', 4.2, 10, 'Smooth caramel & chocolate notes get a massive coffee rogering. Competitively intellectual flavor that makes you feel smarter than you look. Pair with a corduroy blazer and look out world.', 'https://popmenucloud.com/cdn-cgi/image/width%3D1200%2Cheight%3D1200%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/frhniukm/f16976bc-48f3-4c5d-9cd6-c34f759b5c9b.jpg'),
('Club Paradise', 1, 'Sour Ale', 8, 20, 'Our Rotating Tiki Cocktail Inspired Sour IPA brewed with Fruit Purée, Vanilla & Milk Sugar', 'https://liquordepot.ca/cdn/shop/files/indiapaleale.png?v=1689088134'),

('Dire Wolf', 2, 'Porter', 10.5, 35, 'Smooth and velvety ale with notes of roasted malt, dark chocolate, and a hint of smoke.', 'https://res.cloudinary.com/dknqgztin/image/upload/v1712679524/wolf_fake_porter_fxuodv.jpg'),
('Daybreak', 2, 'Coffee Vanilla Cream Ale', 5, 14, 'Light-bodied brilliant clarity iced coffee beer.', 'https://res.cloudinary.com/dknqgztin/image/upload/v1712679920/wolf_fake_belgian_pmavus.jpg'),

('Blonde Ale', 3, 'Blonde Ale', 4.5, 20, 'Light and crisp ale with a subtle malt sweetness and a clean, refreshing finish.', 'https://res.cloudinary.com/dknqgztin/image/upload/v1712679945/knotty-pine-amber-ale_jxcjfb.jpg'),
('Cream Ale', 3, 'Cream Ale', 5.0, 15, 'Smooth and easy-drinking ale with a hint of sweetness and a mild hop bitterness.', 'https://res.cloudinary.com/dknqgztin/image/upload/v1712679932/knotty-pine-pine-lite_mhncxx.jpg'),

('Irish Red Ale', 4, 'Irish Red Ale', 5.0, 25, 'Smooth and malty ale with a rich caramel flavor and a dry, roasted finish.', 'https://614now.com/wp-content/uploads/2018/03/12002936_10153120887531592_4503233706222057652_n.jpg'),
('Scottish Stout', 4, 'Stout', 6.0, 35, 'Dark and roasty ale with flavors of coffee, chocolate, and a hint of smoke.', 'https://res.cloudinary.com/dknqgztin/image/upload/v1712680005/barley_dark_beer_mpxpfa.jpg'),

('Bodhi', 5, 'Double IPA', 8.5, 80, 'Bodhi is a classic double IPA from Columbus Brewing Company, known for its bold hop flavors and citrusy aroma.', 'https://res.cloudinary.com/dknqgztin/image/upload/v1712680511/bodhi-440x716_mtz4nj.webp'),
('Creeper', 5, 'Imperial Stout', 10.2, 65, 'Creeper is a rich and robust imperial stout brewed by Columbus Brewing Company, featuring notes of chocolate, coffee, and caramel.', 'https://res.cloudinary.com/dknqgztin/image/upload/v1712680567/creeper_dj9ctj.webp');



COMMIT TRANSACTION;
