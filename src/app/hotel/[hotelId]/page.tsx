import { getHotelById } from '@/actions/getHotelById'
import AddHotelForm from '@/components/hotel/AddHotelForm'
import { auth } from '@clerk/nextjs/server'
import React from 'react'

interface HotelPageInterface {
  params: {
    hotelId: string
  }
}
const Hotel = async({ params }: HotelPageInterface) => {
const hotel = await getHotelById(params.hotelId)
const {userId} = auth()
if (hotel && hotel.userId!== userId ) return <div>Access denied....</div>
  return (
    <div>
      <AddHotelForm hotel={hotel} />
    </div>
  )
}

export default Hotel