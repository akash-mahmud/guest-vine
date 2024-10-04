-- CreateTable
CREATE TABLE "Hotel" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "locationDescription" TEXT NOT NULL,
    "gym" BOOLEAN NOT NULL DEFAULT false,
    "spa" BOOLEAN NOT NULL DEFAULT false,
    "bar" BOOLEAN NOT NULL DEFAULT false,
    "laundry" BOOLEAN NOT NULL DEFAULT false,
    "restaurant" BOOLEAN NOT NULL DEFAULT false,
    "shopping" BOOLEAN NOT NULL DEFAULT false,
    "freeParking" BOOLEAN NOT NULL DEFAULT false,
    "bikeRental" BOOLEAN NOT NULL DEFAULT false,
    "freeWifi" BOOLEAN NOT NULL DEFAULT false,
    "movieNights" BOOLEAN NOT NULL DEFAULT false,
    "swimmingPool" BOOLEAN NOT NULL DEFAULT false,
    "cofeeShop" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Hotel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Room" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "bedCount" INTEGER NOT NULL DEFAULT 0,
    "guestCount" INTEGER NOT NULL DEFAULT 0,
    "bathroomCount" INTEGER NOT NULL DEFAULT 0,
    "kingBed" INTEGER NOT NULL DEFAULT 0,
    "queenBed" INTEGER NOT NULL DEFAULT 0,
    "image" TEXT NOT NULL,
    "breakFastPrice" INTEGER NOT NULL,
    "roomPrice" INTEGER NOT NULL,
    "roomService" BOOLEAN NOT NULL DEFAULT false,
    "TV" BOOLEAN NOT NULL DEFAULT false,
    "balcony" BOOLEAN NOT NULL DEFAULT false,
    "freeWifi" BOOLEAN NOT NULL DEFAULT false,
    "cityView" BOOLEAN NOT NULL DEFAULT false,
    "oceanView" BOOLEAN NOT NULL DEFAULT false,
    "forestView" BOOLEAN NOT NULL DEFAULT false,
    "mountainView" BOOLEAN NOT NULL DEFAULT false,
    "airCondition" BOOLEAN NOT NULL DEFAULT false,
    "soundProofed" BOOLEAN NOT NULL DEFAULT false,
    "hotelId" TEXT NOT NULL,

    CONSTRAINT "Room_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Booking" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "hotelId" TEXT NOT NULL,
    "hotelOwnerId" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "breakfastIncluded" BOOLEAN NOT NULL,
    "currency" TEXT NOT NULL,
    "totalPrice" DOUBLE PRECISION NOT NULL,
    "paymentIntendId" TEXT NOT NULL,
    "bookedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "paymentStatus" BOOLEAN NOT NULL DEFAULT false,
    "roomId" TEXT NOT NULL,

    CONSTRAINT "Booking_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Booking_paymentIntendId_key" ON "Booking"("paymentIntendId");

-- AddForeignKey
ALTER TABLE "Room" ADD CONSTRAINT "Room_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "Hotel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Booking" ADD CONSTRAINT "Booking_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "Hotel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Booking" ADD CONSTRAINT "Booking_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
