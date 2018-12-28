class Agency < ApplicationRecord

  validates_presence_of :name, :phone, :street_address, :city, :state, :zip_code
  validates :approved, inclusion: { in: [ true, false ] }

  validates :name,
    length: { minimum: 1, maximum: 50 },
    uniqueness: true

  validates :phone, numericality: true
  validates :zip_code, numericality: true
  validates :state, length: { is: 2 }

  validates_format_of :phone, with: /\A\d{10}\z/
  validates_format_of :state, with: /\A(?-i:A[LKZR]|C[AOT]|D[EC]|F[L]|G[A]|HI|I[ADLN]|K[SY]|LA|M[ADEINOST]|N[CDEHJMVY]|O[HKR]|PA|RI|S[CD]|T[NX]|UT|V[AT]|W[AIVY])\z/
  validates_format_of :zip_code, with: /\A\d{5}\z/

  # has_many :patients
  # has_many :visits, through: :patients
  # has_one :contract
end
