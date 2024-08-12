/* Data Cleaning */
SELECT *
FROM [NashvilleHousingData]

/* Converting SaleDate to a proper format */
SELECT *, 
CONVERT(Date,SaleDate)
FROM [NashvilleHousingData]

UPDATE [NashvilleHousingData]
SET SaleDate = CONVERT(Date, SaleDate)

-- Populating PropertyAddress with the right corresponding data
SELECT *
FROM [NashvilleHousingData]
ORDER BY ParcelID

-- I created a self join, having realised that corresponding "ParcelId" have the same PropertyAddress
SELECT *
FROM [NashvilleHousingData] As A
JOIN [NashvilleHousingData] As B
on [A].ParcelID = [B].ParcelID
AND [A].[UniqueID ] <> [B].[UniqueID ]
WHERE [A].PropertyAddress is null

-- Then populated table A with the propertyAddress information from B
UPDATE A
SET PropertyAddress = ISNULL([A].PropertyAddress, [B].PropertyAddress)
FROM [NashvilleHousingData] As A
JOIN [NashvilleHousingData] As B
on [A].ParcelID = [B].ParcelID
AND [A].[UniqueID ] <> [B].[UniqueID ]
WHERE [A].PropertyAddress is null

-- It worked!
SELECT *
FROM [NashvilleHousingData]

-- Under soldasvacant, the values should be 'Yes'or 'No', however, some were 'N', 'Y'. I had to resolve that.
UPDATE [NashvilleHousingData]
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
					WHEN SoldAsVacant = 'N' THEN 'No'
					ELSE SoldAsVacant
					END

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM [NashvilleHousingData]
GROUP BY SoldAsVacant

SELECT ParcelID, PropertyAddress, SaleDate, SalePrice, LegalReference, OwnerName, COUNT(*)
FROM [NashvilleHousingData]
GROUP BY ParcelID, PropertyAddress, SaleDate, SalePrice, LegalReference, OwnerName
HAVING COUNT(*) > 1

-- Creating a partition to delete duplicate rows
WITH NashvilleHousingDataCTE As(
SELECT *, ROW_NUMBER() OVER(Partition By ParcelID, PropertyAddress, SaleDate, SalePrice, LegalReference, OwnerName ORDER BY RowNumber) As RN
FROM [NashvilleHousingData]
)
SELECT *
FROM NashvilleHousingDataCTE
WHERE RN > 1

-- Deleting duplicate row
WITH NashvilleHousingDataCTE As(
SELECT *, ROW_NUMBER() OVER(Partition By ParcelID, PropertyAddress, SaleDate, SalePrice, LegalReference, OwnerName ORDER BY RowNumber) As RN
FROM [NashvilleHousingData]
)
DELETE FROM NashvilleHousingDataCTE
WHERE RN > 1

SELECT *
FROM [NashvilleHousingData]

SELECT *
FROM [NashvilleHousingData]
WHERE [OwnerName] IS NULL
AND [OwnerAddress] IS NULL

-- To delete Columns that wont be in use (this is not advisable though so i'm just adding it for lesons)

/* ALTER TABLE [NashvilleHousingData]
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress */

