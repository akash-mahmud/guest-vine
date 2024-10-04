"use client"
import {UserButton} from '@clerk/nextjs'
export default function NavBar() {
  return (
    <div>
        <UserButton afterSwitchSessionUrl='/'/>
    </div>
  )
}
