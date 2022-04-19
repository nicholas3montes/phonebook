# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


address = Address.new(street:'Rua São Rafael', number: 97, city:'são paulo')
address.save!

address2 = Address.new(street:'Rua São Joao', number: 8, city:'Cidade do vaticano')
address2.save!

address3 = Address.new(street:'Rua São Judas tadeu', number: 16, city:'São Francisco')
address3.save!

address4 = Address.new(street:'Rua São Gennaro', number: 2, city:'Pomerode')
address4.save!

address5 = Address.new(street:'Rua São Joaquim', number: 77, city:'São tomé das letras')
address5.save!

address6 = Address.new(street:'Rua São Pedro', number: 60, city:'Divinopolis')
address6.save!

contact = Contact.new(name: 'julio', birthdate: '1930-05-11', phone: '(11)9899-9985', address: address)
contact.save!

contact2 = Contact.new(name: 'Alisson', birthdate: '1962-11-10', phone: '(66)96666-6666', address: address2)
contact2.save!

contact3 = Contact.new(name: 'Nicholas', birthdate: '1900-06-1', phone: '(11)96959-1185', address: address3)
contact3.save!

contact4 = Contact.new(name: 'Jonathan', birthdate: '1830-04-5', phone: '(21)99399-9225', address: address4)
contact4.save!

contact5 = Contact.new(name: 'Mario bros', birthdate: '1500-05-22', phone: '(81)94859-0085', address: address5)
contact5.save!

contact6 = Contact.new(name: 'Bathman', birthdate: '1950-02-10', phone: '(11)99624-5587', address: address6)
contact6.save!