--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
package Windows.Storage.AccessCache is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AccessCacheOptions is (
      None,
      DisallowUserInput,
      FastLocationsOnly,
      UseReadOnlyCachedCopy,
      SuppressAccessTimeUpdate
   );
   for AccessCacheOptions use (
      None => 0,
      DisallowUserInput => 1,
      FastLocationsOnly => 2,
      UseReadOnlyCachedCopy => 4,
      SuppressAccessTimeUpdate => 8
   );
   for AccessCacheOptions'Size use 32;
   
   type AccessCacheOptions_Ptr is access AccessCacheOptions;
   
   type RecentStorageItemVisibility is (
      AppOnly,
      AppAndSystem
   );
   for RecentStorageItemVisibility use (
      AppOnly => 0,
      AppAndSystem => 1
   );
   for RecentStorageItemVisibility'Size use 32;
   
   type RecentStorageItemVisibility_Ptr is access RecentStorageItemVisibility;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type AccessListEntry is record
      Token : Windows.String;
      Metadata : Windows.String;
   end record;
   pragma Convention (C_Pass_By_Copy , AccessListEntry);
   
   type AccessListEntry_Ptr is access AccessListEntry;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved_Interface;
   type TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved is access all TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved_Interface'Class;
   type TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved_Ptr is access all TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IItemRemovedEventArgs_Interface;
   type IItemRemovedEventArgs is access all IItemRemovedEventArgs_Interface'Class;
   type IItemRemovedEventArgs_Ptr is access all IItemRemovedEventArgs;
   type IVectorView_AccessListEntry_Interface;
   type IVectorView_AccessListEntry is access all IVectorView_AccessListEntry_Interface'Class;
   type IVectorView_AccessListEntry_Ptr is access all IVectorView_AccessListEntry;
   type IIterable_AccessListEntry_Interface;
   type IIterable_AccessListEntry is access all IIterable_AccessListEntry_Interface'Class;
   type IIterable_AccessListEntry_Ptr is access all IIterable_AccessListEntry;
   type IStorageItemAccessList_Interface;
   type IStorageItemAccessList is access all IStorageItemAccessList_Interface'Class;
   type IStorageItemAccessList_Ptr is access all IStorageItemAccessList;
   type IStorageItemMostRecentlyUsedList_Interface;
   type IStorageItemMostRecentlyUsedList is access all IStorageItemMostRecentlyUsedList_Interface'Class;
   type IStorageItemMostRecentlyUsedList_Ptr is access all IStorageItemMostRecentlyUsedList;
   type IStorageItemMostRecentlyUsedList2_Interface;
   type IStorageItemMostRecentlyUsedList2 is access all IStorageItemMostRecentlyUsedList2_Interface'Class;
   type IStorageItemMostRecentlyUsedList2_Ptr is access all IStorageItemMostRecentlyUsedList2;
   type IStorageApplicationPermissionsStatics_Interface;
   type IStorageApplicationPermissionsStatics is access all IStorageApplicationPermissionsStatics_Interface'Class;
   type IStorageApplicationPermissionsStatics_Ptr is access all IStorageApplicationPermissionsStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IItemRemovedEventArgs : aliased constant Windows.IID := (1499954780, 21950, 19558, (186, 102, 94, 174, 167, 157, 38, 49 ));
   
   type IItemRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemovedEntry
   (
      This       : access IItemRemovedEventArgs_Interface
      ; RetVal : access Windows.Storage.AccessCache.AccessListEntry
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_AccessListEntry : aliased constant Windows.IID := (1119132554, 12308, 23847, (143, 44, 30, 245, 238, 137, 236, 0 ));
   
   type IVectorView_AccessListEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_AccessListEntry_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.AccessCache.AccessListEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_AccessListEntry_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_AccessListEntry_Interface
      ; value : Windows.Storage.AccessCache.AccessListEntry
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_AccessListEntry_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.AccessCache.AccessListEntry_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_AccessListEntry : aliased constant Windows.IID := (1234551472, 29547, 22669, (174, 66, 111, 105, 176, 37, 179, 136 ));
   
   type IIterable_AccessListEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_AccessListEntry_Interface
      ; RetVal : access Windows.Storage.AccessCache.AccessListEntry
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStorageItemAccessList : aliased constant Windows.IID := (749729453, 56976, 18421, (178, 195, 221, 54, 201, 253, 212, 83 ));
   
   type IStorageItemAccessList_Interface is interface and Windows.IInspectable_Interface;
   
   function AddOverloadDefaultMetadata
   (
      This       : access IStorageItemAccessList_Interface
      ; file : Windows.Storage.IStorageItem
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Add
   (
      This       : access IStorageItemAccessList_Interface
      ; file : Windows.Storage.IStorageItem
      ; metadata : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddOrReplaceOverloadDefaultMetadata
   (
      This       : access IStorageItemAccessList_Interface
      ; token : Windows.String
      ; file : Windows.Storage.IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function AddOrReplace
   (
      This       : access IStorageItemAccessList_Interface
      ; token : Windows.String
      ; file : Windows.Storage.IStorageItem
      ; metadata : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetItemAsync
   (
      This       : access IStorageItemAccessList_Interface
      ; token : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFileAsync
   (
      This       : access IStorageItemAccessList_Interface
      ; token : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFolderAsync
   (
      This       : access IStorageItemAccessList_Interface
      ; token : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemWithOptionsAsync
   (
      This       : access IStorageItemAccessList_Interface
      ; token : Windows.String
      ; options : Windows.Storage.AccessCache.AccessCacheOptions
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFileWithOptionsAsync
   (
      This       : access IStorageItemAccessList_Interface
      ; token : Windows.String
      ; options : Windows.Storage.AccessCache.AccessCacheOptions
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFolderWithOptionsAsync
   (
      This       : access IStorageItemAccessList_Interface
      ; token : Windows.String
      ; options : Windows.Storage.AccessCache.AccessCacheOptions
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IStorageItemAccessList_Interface
      ; token : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ContainsItem
   (
      This       : access IStorageItemAccessList_Interface
      ; token : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IStorageItemAccessList_Interface
   )
   return Windows.HRESULT is abstract;
   
   function CheckAccess
   (
      This       : access IStorageItemAccessList_Interface
      ; file : Windows.Storage.IStorageItem
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Entries
   (
      This       : access IStorageItemAccessList_Interface
      ; RetVal : access Windows.Storage.AccessCache.IVectorView_AccessListEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_MaximumItemsAllowed
   (
      This       : access IStorageItemAccessList_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStorageItemMostRecentlyUsedList : aliased constant Windows.IID := (23214549, 20749, 16670, (140, 241, 195, 209, 239, 250, 76, 51 ));
   
   type IStorageItemMostRecentlyUsedList_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ItemRemoved
   (
      This       : access IStorageItemMostRecentlyUsedList_Interface
      ; handler : TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ItemRemoved
   (
      This       : access IStorageItemMostRecentlyUsedList_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStorageItemMostRecentlyUsedList2 : aliased constant Windows.IID := (3662159520, 60813, 18225, (161, 219, 228, 78, 226, 32, 64, 147 ));
   
   type IStorageItemMostRecentlyUsedList2_Interface is interface and Windows.IInspectable_Interface;
   
   function AddWithMetadataAndVisibility
   (
      This       : access IStorageItemMostRecentlyUsedList2_Interface
      ; file : Windows.Storage.IStorageItem
      ; metadata : Windows.String
      ; visibility : Windows.Storage.AccessCache.RecentStorageItemVisibility
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddOrReplaceWithMetadataAndVisibility
   (
      This       : access IStorageItemMostRecentlyUsedList2_Interface
      ; token : Windows.String
      ; file : Windows.Storage.IStorageItem
      ; metadata : Windows.String
      ; visibility : Windows.Storage.AccessCache.RecentStorageItemVisibility
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStorageApplicationPermissionsStatics : aliased constant Windows.IID := (1133633450, 53299, 18681, (128, 96, 62, 200, 71, 210, 227, 241 ));
   
   type IStorageApplicationPermissionsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FutureAccessList
   (
      This       : access IStorageApplicationPermissionsStatics_Interface
      ; RetVal : access Windows.Storage.AccessCache.IStorageItemAccessList
   )
   return Windows.HRESULT is abstract;
   
   function get_MostRecentlyUsedList
   (
      This       : access IStorageApplicationPermissionsStatics_Interface
      ; RetVal : access Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved : aliased constant Windows.IID := (43887848, 39121, 23543, (183, 128, 151, 23, 233, 80, 39, 255 ));
   
   type TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved_Interface(Callback : access procedure (sender : Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList ; args : Windows.Storage.AccessCache.IItemRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved_Interface
      ; sender : Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList
      ; args : Windows.Storage.AccessCache.IItemRemovedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AccessListEntryView is Windows.Storage.AccessCache.IVectorView_AccessListEntry;
   subtype StorageItemMostRecentlyUsedList is Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList;
   subtype ItemRemovedEventArgs is Windows.Storage.AccessCache.IItemRemovedEventArgs;
   subtype StorageItemAccessList is Windows.Storage.AccessCache.IStorageItemAccessList;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_FutureAccessList
   return Windows.Storage.AccessCache.IStorageItemAccessList;
   
   function get_MostRecentlyUsedList
   return Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList;
   
end;
