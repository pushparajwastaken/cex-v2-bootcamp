-- CreateEnum
CREATE TYPE "Status" AS ENUM ('Filled', 'Completed', 'Open');

-- CreateTable
CREATE TABLE "Order" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "market" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "qty" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "side" TEXT NOT NULL,
    "filledQty" INTEGER NOT NULL,
    "status" "Status" NOT NULL,
    "createdAT" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Fill" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "qty" INTEGER NOT NULL,
    "side" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "asset" TEXT NOT NULL,
    "originalOrderID" TEXT NOT NULL,
    "createdAT" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Fill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Stocks" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "symbol" TEXT NOT NULL,

    CONSTRAINT "Stocks_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Fill" ADD CONSTRAINT "Fill_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Fill" ADD CONSTRAINT "Fill_originalOrderID_fkey" FOREIGN KEY ("originalOrderID") REFERENCES "Order"("id") ON DELETE CASCADE ON UPDATE CASCADE;
