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
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
limited with Windows.System;
limited with Windows.Security.Cryptography.Certificates;
limited with Windows.ApplicationModel.Appointments;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Email is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type EmailCertificateValidationStatus is (
      Success,
      NoMatch,
      InvalidUsage,
      InvalidCertificate,
      Revoked,
      ChainRevoked,
      RevocationServerFailure,
      Expired,
      Untrusted,
      ServerError,
      UnknownFailure
   );
   for EmailCertificateValidationStatus use (
      Success => 0,
      NoMatch => 1,
      InvalidUsage => 2,
      InvalidCertificate => 3,
      Revoked => 4,
      ChainRevoked => 5,
      RevocationServerFailure => 6,
      Expired => 7,
      Untrusted => 8,
      ServerError => 9,
      UnknownFailure => 10
   );
   for EmailCertificateValidationStatus'Size use 32;
   
   type EmailCertificateValidationStatus_Ptr is access EmailCertificateValidationStatus;
   
   type EmailStoreAccessType is (
      AppMailboxesReadWrite,
      AllMailboxesLimitedReadWrite
   );
   for EmailStoreAccessType use (
      AppMailboxesReadWrite => 0,
      AllMailboxesLimitedReadWrite => 1
   );
   for EmailStoreAccessType'Size use 32;
   
   type EmailStoreAccessType_Ptr is access EmailStoreAccessType;
   
   type EmailMessageBodyKind is (
      Html,
      PlainText
   );
   for EmailMessageBodyKind use (
      Html => 0,
      PlainText => 1
   );
   for EmailMessageBodyKind'Size use 32;
   
   type EmailMessageBodyKind_Ptr is access EmailMessageBodyKind;
   
   type EmailAttachmentDownloadState is (
      NotDownloaded,
      Downloading,
      Downloaded,
      Failed
   );
   for EmailAttachmentDownloadState use (
      NotDownloaded => 0,
      Downloading => 1,
      Downloaded => 2,
      Failed => 3
   );
   for EmailAttachmentDownloadState'Size use 32;
   
   type EmailAttachmentDownloadState_Ptr is access EmailAttachmentDownloadState;
   
   type EmailMessageDownloadState is (
      PartiallyDownloaded,
      Downloading,
      Downloaded,
      Failed
   );
   for EmailMessageDownloadState use (
      PartiallyDownloaded => 0,
      Downloading => 1,
      Downloaded => 2,
      Failed => 3
   );
   for EmailMessageDownloadState'Size use 32;
   
   type EmailMessageDownloadState_Ptr is access EmailMessageDownloadState;
   
   type EmailSpecialFolderKind is (
      None,
      Root,
      Inbox,
      Outbox,
      Drafts,
      DeletedItems,
      Sent
   );
   for EmailSpecialFolderKind use (
      None => 0,
      Root => 1,
      Inbox => 2,
      Outbox => 3,
      Drafts => 4,
      DeletedItems => 5,
      Sent => 6
   );
   for EmailSpecialFolderKind'Size use 32;
   
   type EmailSpecialFolderKind_Ptr is access EmailSpecialFolderKind;
   
   type EmailQueryKind is (
      All_x,
      Important,
      Flagged,
      Unread,
      Read,
      Unseen
   );
   for EmailQueryKind use (
      All_x => 0,
      Important => 1,
      Flagged => 2,
      Unread => 3,
      Read => 4,
      Unseen => 5
   );
   for EmailQueryKind'Size use 32;
   
   type EmailQueryKind_Ptr is access EmailQueryKind;
   
   type EmailMailboxChangeType is (
      MessageCreated,
      MessageModified,
      MessageDeleted,
      FolderCreated,
      FolderModified,
      FolderDeleted,
      ChangeTrackingLost
   );
   for EmailMailboxChangeType use (
      MessageCreated => 0,
      MessageModified => 1,
      MessageDeleted => 2,
      FolderCreated => 3,
      FolderModified => 4,
      FolderDeleted => 5,
      ChangeTrackingLost => 6
   );
   for EmailMailboxChangeType'Size use 32;
   
   type EmailMailboxChangeType_Ptr is access EmailMailboxChangeType;
   
   type EmailQuerySortDirection is (
      Descending,
      Ascending
   );
   for EmailQuerySortDirection use (
      Descending => 0,
      Ascending => 1
   );
   for EmailQuerySortDirection'Size use 32;
   
   type EmailQuerySortDirection_Ptr is access EmailQuerySortDirection;
   
   type EmailQuerySortProperty is (
      Date
   );
   for EmailQuerySortProperty use (
      Date => 0
   );
   for EmailQuerySortProperty'Size use 32;
   
   type EmailQuerySortProperty_Ptr is access EmailQuerySortProperty;
   
   type EmailQuerySearchFields is (
      None,
      Subject,
      Sender,
      Preview,
      Recipients,
      All_x
   );
   for EmailQuerySearchFields use (
      None => 0,
      Subject => 1,
      Sender => 2,
      Preview => 4,
      Recipients => 8,
      All_x => 4294967295
   );
   for EmailQuerySearchFields'Size use 32;
   
   type EmailQuerySearchFields_Ptr is access EmailQuerySearchFields;
   
   type EmailBatchStatus is (
      Success,
      ServerSearchSyncManagerError,
      ServerSearchUnknownError
   );
   for EmailBatchStatus use (
      Success => 0,
      ServerSearchSyncManagerError => 1,
      ServerSearchUnknownError => 2
   );
   for EmailBatchStatus'Size use 32;
   
   type EmailBatchStatus_Ptr is access EmailBatchStatus;
   
   type EmailMessageResponseKind is (
      None,
      Reply,
      ReplyAll,
      Forward
   );
   for EmailMessageResponseKind use (
      None => 0,
      Reply => 1,
      ReplyAll => 2,
      Forward => 3
   );
   for EmailMessageResponseKind'Size use 32;
   
   type EmailMessageResponseKind_Ptr is access EmailMessageResponseKind;
   
   type EmailMeetingResponseType is (
      Accept_x,
      Decline,
      Tentative
   );
   for EmailMeetingResponseType use (
      Accept_x => 0,
      Decline => 1,
      Tentative => 2
   );
   for EmailMeetingResponseType'Size use 32;
   
   type EmailMeetingResponseType_Ptr is access EmailMeetingResponseType;
   
   type EmailMailboxActionKind is (
      MarkMessageAsSeen,
      MarkMessageRead,
      ChangeMessageFlagState,
      MoveMessage,
      SaveDraft,
      SendMessage,
      CreateResponseReplyMessage,
      CreateResponseReplyAllMessage,
      CreateResponseForwardMessage,
      MoveFolder,
      MarkFolderForSyncEnabled
   );
   for EmailMailboxActionKind use (
      MarkMessageAsSeen => 0,
      MarkMessageRead => 1,
      ChangeMessageFlagState => 2,
      MoveMessage => 3,
      SaveDraft => 4,
      SendMessage => 5,
      CreateResponseReplyMessage => 6,
      CreateResponseReplyAllMessage => 7,
      CreateResponseForwardMessage => 8,
      MoveFolder => 9,
      MarkFolderForSyncEnabled => 10
   );
   for EmailMailboxActionKind'Size use 32;
   
   type EmailMailboxActionKind_Ptr is access EmailMailboxActionKind;
   
   type EmailImportance is (
      Normal,
      High,
      Low
   );
   for EmailImportance use (
      Normal => 0,
      High => 1,
      Low => 2
   );
   for EmailImportance'Size use 32;
   
   type EmailImportance_Ptr is access EmailImportance;
   
   type EmailFlagState is (
      Unflagged,
      Flagged,
      Completed,
      Cleared
   );
   for EmailFlagState use (
      Unflagged => 0,
      Flagged => 1,
      Completed => 2,
      Cleared => 3
   );
   for EmailFlagState'Size use 32;
   
   type EmailFlagState_Ptr is access EmailFlagState;
   
   type EmailMailboxSyncStatus is (
      Idle,
      Syncing,
      UpToDate,
      AuthenticationError,
      PolicyError,
      UnknownError,
      ManualAccountRemovalRequired
   );
   for EmailMailboxSyncStatus use (
      Idle => 0,
      Syncing => 1,
      UpToDate => 2,
      AuthenticationError => 3,
      PolicyError => 4,
      UnknownError => 5,
      ManualAccountRemovalRequired => 6
   );
   for EmailMailboxSyncStatus'Size use 32;
   
   type EmailMailboxSyncStatus_Ptr is access EmailMailboxSyncStatus;
   
   type EmailMailboxOtherAppReadAccess is (
      SystemOnly,
      Full,
      None
   );
   for EmailMailboxOtherAppReadAccess use (
      SystemOnly => 0,
      Full => 1,
      None => 2
   );
   for EmailMailboxOtherAppReadAccess'Size use 32;
   
   type EmailMailboxOtherAppReadAccess_Ptr is access EmailMailboxOtherAppReadAccess;
   
   type EmailMailboxOtherAppWriteAccess is (
      None,
      Limited_x
   );
   for EmailMailboxOtherAppWriteAccess use (
      None => 0,
      Limited_x => 1
   );
   for EmailMailboxOtherAppWriteAccess'Size use 32;
   
   type EmailMailboxOtherAppWriteAccess_Ptr is access EmailMailboxOtherAppWriteAccess;
   
   type EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation is (
      None,
      StrongAlgorithm,
      AnyAlgorithm
   );
   for EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation use (
      None => 0,
      StrongAlgorithm => 1,
      AnyAlgorithm => 2
   );
   for EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation'Size use 32;
   
   type EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation_Ptr is access EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation;
   
   type EmailMailboxSmimeEncryptionAlgorithm is (
      Any,
      TripleDes,
      Des,
      RC2128Bit,
      RC264Bit,
      RC240Bit
   );
   for EmailMailboxSmimeEncryptionAlgorithm use (
      Any => 0,
      TripleDes => 1,
      Des => 2,
      RC2128Bit => 3,
      RC264Bit => 4,
      RC240Bit => 5
   );
   for EmailMailboxSmimeEncryptionAlgorithm'Size use 32;
   
   type EmailMailboxSmimeEncryptionAlgorithm_Ptr is access EmailMailboxSmimeEncryptionAlgorithm;
   
   type EmailMailboxSmimeSigningAlgorithm is (
      Any,
      Sha1,
      MD5
   );
   for EmailMailboxSmimeSigningAlgorithm use (
      Any => 0,
      Sha1 => 1,
      MD5 => 2
   );
   for EmailMailboxSmimeSigningAlgorithm'Size use 32;
   
   type EmailMailboxSmimeSigningAlgorithm_Ptr is access EmailMailboxSmimeSigningAlgorithm;
   
   type EmailMailboxAutoReplyMessageResponseKind is (
      Html,
      PlainText
   );
   for EmailMailboxAutoReplyMessageResponseKind use (
      Html => 0,
      PlainText => 1
   );
   for EmailMailboxAutoReplyMessageResponseKind'Size use 32;
   
   type EmailMailboxAutoReplyMessageResponseKind_Ptr is access EmailMailboxAutoReplyMessageResponseKind;
   
   type EmailQuerySearchScope is (
      Local,
      Server
   );
   for EmailQuerySearchScope use (
      Local => 0,
      Server => 1
   );
   for EmailQuerySearchScope'Size use 32;
   
   type EmailQuerySearchScope_Ptr is access EmailQuerySearchScope;
   
   type EmailRecipientResolutionStatus is (
      Success,
      RecipientNotFound,
      AmbiguousRecipient,
      NoCertificate,
      CertificateRequestLimitReached,
      CannotResolveDistributionList,
      ServerError,
      UnknownFailure
   );
   for EmailRecipientResolutionStatus use (
      Success => 0,
      RecipientNotFound => 1,
      AmbiguousRecipient => 2,
      NoCertificate => 3,
      CertificateRequestLimitReached => 4,
      CannotResolveDistributionList => 5,
      ServerError => 6,
      UnknownFailure => 7
   );
   for EmailRecipientResolutionStatus'Size use 32;
   
   type EmailRecipientResolutionStatus_Ptr is access EmailRecipientResolutionStatus;
   
   type EmailMessageSmimeKind is (
      None,
      ClearSigned,
      OpaqueSigned,
      Encrypted
   );
   for EmailMessageSmimeKind use (
      None => 0,
      ClearSigned => 1,
      OpaqueSigned => 2,
      Encrypted => 3
   );
   for EmailMessageSmimeKind'Size use 32;
   
   type EmailMessageSmimeKind_Ptr is access EmailMessageSmimeKind;
   
   type EmailMailboxEmptyFolderStatus is (
      Success,
      NetworkError,
      PermissionsError,
      ServerError,
      UnknownFailure,
      CouldNotDeleteEverything
   );
   for EmailMailboxEmptyFolderStatus use (
      Success => 0,
      NetworkError => 1,
      PermissionsError => 2,
      ServerError => 3,
      UnknownFailure => 4,
      CouldNotDeleteEverything => 5
   );
   for EmailMailboxEmptyFolderStatus'Size use 32;
   
   type EmailMailboxEmptyFolderStatus_Ptr is access EmailMailboxEmptyFolderStatus;
   
   type EmailMailboxCreateFolderStatus is (
      Success,
      NetworkError,
      PermissionsError,
      ServerError,
      UnknownFailure,
      NameCollision,
      ServerRejected
   );
   for EmailMailboxCreateFolderStatus use (
      Success => 0,
      NetworkError => 1,
      PermissionsError => 2,
      ServerError => 3,
      UnknownFailure => 4,
      NameCollision => 5,
      ServerRejected => 6
   );
   for EmailMailboxCreateFolderStatus'Size use 32;
   
   type EmailMailboxCreateFolderStatus_Ptr is access EmailMailboxCreateFolderStatus;
   
   type EmailMailboxDeleteFolderStatus is (
      Success,
      NetworkError,
      PermissionsError,
      ServerError,
      UnknownFailure,
      CouldNotDeleteEverything
   );
   for EmailMailboxDeleteFolderStatus use (
      Success => 0,
      NetworkError => 1,
      PermissionsError => 2,
      ServerError => 3,
      UnknownFailure => 4,
      CouldNotDeleteEverything => 5
   );
   for EmailMailboxDeleteFolderStatus'Size use 32;
   
   type EmailMailboxDeleteFolderStatus_Ptr is access EmailMailboxDeleteFolderStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IEmailStore_Interface;
   type AsyncOperationCompletedHandler_IEmailStore is access all AsyncOperationCompletedHandler_IEmailStore_Interface'Class;
   type AsyncOperationCompletedHandler_IEmailStore_Ptr is access all AsyncOperationCompletedHandler_IEmailStore;
   type AsyncOperationCompletedHandler_IEmailMailbox_Interface;
   type AsyncOperationCompletedHandler_IEmailMailbox is access all AsyncOperationCompletedHandler_IEmailMailbox_Interface'Class;
   type AsyncOperationCompletedHandler_IEmailMailbox_Ptr is access all AsyncOperationCompletedHandler_IEmailMailbox;
   type AsyncOperationCompletedHandler_IEmailConversation_Interface;
   type AsyncOperationCompletedHandler_IEmailConversation is access all AsyncOperationCompletedHandler_IEmailConversation_Interface'Class;
   type AsyncOperationCompletedHandler_IEmailConversation_Ptr is access all AsyncOperationCompletedHandler_IEmailConversation;
   type AsyncOperationCompletedHandler_IEmailFolder_Interface;
   type AsyncOperationCompletedHandler_IEmailFolder is access all AsyncOperationCompletedHandler_IEmailFolder_Interface'Class;
   type AsyncOperationCompletedHandler_IEmailFolder_Ptr is access all AsyncOperationCompletedHandler_IEmailFolder;
   type AsyncOperationCompletedHandler_IEmailMessage_Interface;
   type AsyncOperationCompletedHandler_IEmailMessage is access all AsyncOperationCompletedHandler_IEmailMessage_Interface'Class;
   type AsyncOperationCompletedHandler_IEmailMessage_Ptr is access all AsyncOperationCompletedHandler_IEmailMessage;
   type TypedEventHandler_IEmailMailbox_add_MailboxChanged_Interface;
   type TypedEventHandler_IEmailMailbox_add_MailboxChanged is access all TypedEventHandler_IEmailMailbox_add_MailboxChanged_Interface'Class;
   type TypedEventHandler_IEmailMailbox_add_MailboxChanged_Ptr is access all TypedEventHandler_IEmailMailbox_add_MailboxChanged;
   type AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings_Interface;
   type AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings is access all AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings_Interface'Class;
   type AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings_Ptr is access all AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings;
   type AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus_Interface;
   type AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus is access all AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus_Interface'Class;
   type AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus_Ptr is access all AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus;
   type AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult_Interface;
   type AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult is access all AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult_Interface'Class;
   type AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult_Ptr is access all AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult;
   type AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus_Interface;
   type AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus is access all AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus_Interface'Class;
   type AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus_Ptr is access all AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus;
   type TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged_Interface;
   type TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged is access all TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged_Interface'Class;
   type TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged_Ptr is access all TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged;
   type AsyncOperationCompletedHandler_IEmailItemCounts_Interface;
   type AsyncOperationCompletedHandler_IEmailItemCounts is access all AsyncOperationCompletedHandler_IEmailItemCounts_Interface'Class;
   type AsyncOperationCompletedHandler_IEmailItemCounts_Ptr is access all AsyncOperationCompletedHandler_IEmailItemCounts;
   type AsyncOperationCompletedHandler_IEmailConversationBatch_Interface;
   type AsyncOperationCompletedHandler_IEmailConversationBatch is access all AsyncOperationCompletedHandler_IEmailConversationBatch_Interface'Class;
   type AsyncOperationCompletedHandler_IEmailConversationBatch_Ptr is access all AsyncOperationCompletedHandler_IEmailConversationBatch;
   type AsyncOperationCompletedHandler_IEmailMessageBatch_Interface;
   type AsyncOperationCompletedHandler_IEmailMessageBatch is access all AsyncOperationCompletedHandler_IEmailMessageBatch_Interface'Class;
   type AsyncOperationCompletedHandler_IEmailMessageBatch_Ptr is access all AsyncOperationCompletedHandler_IEmailMessageBatch;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IEmailManagerStatics_Interface;
   type IEmailManagerStatics is access all IEmailManagerStatics_Interface'Class;
   type IEmailManagerStatics_Ptr is access all IEmailManagerStatics;
   type IEmailManagerStatics2_Interface;
   type IEmailManagerStatics2 is access all IEmailManagerStatics2_Interface'Class;
   type IEmailManagerStatics2_Ptr is access all IEmailManagerStatics2;
   type IEmailManagerStatics3_Interface;
   type IEmailManagerStatics3 is access all IEmailManagerStatics3_Interface'Class;
   type IEmailManagerStatics3_Ptr is access all IEmailManagerStatics3;
   type IEmailManagerForUser_Interface;
   type IEmailManagerForUser is access all IEmailManagerForUser_Interface'Class;
   type IEmailManagerForUser_Ptr is access all IEmailManagerForUser;
   type IEmailStore_Interface;
   type IEmailStore is access all IEmailStore_Interface'Class;
   type IEmailStore_Ptr is access all IEmailStore;
   type IEmailRecipient_Interface;
   type IEmailRecipient is access all IEmailRecipient_Interface'Class;
   type IEmailRecipient_Ptr is access all IEmailRecipient;
   type IEmailRecipientFactory_Interface;
   type IEmailRecipientFactory is access all IEmailRecipientFactory_Interface'Class;
   type IEmailRecipientFactory_Ptr is access all IEmailRecipientFactory;
   type IEmailIrmTemplate_Interface;
   type IEmailIrmTemplate is access all IEmailIrmTemplate_Interface'Class;
   type IEmailIrmTemplate_Ptr is access all IEmailIrmTemplate;
   type IEmailIrmTemplateFactory_Interface;
   type IEmailIrmTemplateFactory is access all IEmailIrmTemplateFactory_Interface'Class;
   type IEmailIrmTemplateFactory_Ptr is access all IEmailIrmTemplateFactory;
   type IEmailIrmInfo_Interface;
   type IEmailIrmInfo is access all IEmailIrmInfo_Interface'Class;
   type IEmailIrmInfo_Ptr is access all IEmailIrmInfo;
   type IEmailIrmInfoFactory_Interface;
   type IEmailIrmInfoFactory is access all IEmailIrmInfoFactory_Interface'Class;
   type IEmailIrmInfoFactory_Ptr is access all IEmailIrmInfoFactory;
   type IEmailMessage_Interface;
   type IEmailMessage is access all IEmailMessage_Interface'Class;
   type IEmailMessage_Ptr is access all IEmailMessage;
   type IEmailMessage2_Interface;
   type IEmailMessage2 is access all IEmailMessage2_Interface'Class;
   type IEmailMessage2_Ptr is access all IEmailMessage2;
   type IEmailMessage3_Interface;
   type IEmailMessage3 is access all IEmailMessage3_Interface'Class;
   type IEmailMessage3_Ptr is access all IEmailMessage3;
   type IEmailMessage4_Interface;
   type IEmailMessage4 is access all IEmailMessage4_Interface'Class;
   type IEmailMessage4_Ptr is access all IEmailMessage4;
   type IEmailAttachment_Interface;
   type IEmailAttachment is access all IEmailAttachment_Interface'Class;
   type IEmailAttachment_Ptr is access all IEmailAttachment;
   type IEmailAttachment2_Interface;
   type IEmailAttachment2 is access all IEmailAttachment2_Interface'Class;
   type IEmailAttachment2_Ptr is access all IEmailAttachment2;
   type IEmailAttachmentFactory_Interface;
   type IEmailAttachmentFactory is access all IEmailAttachmentFactory_Interface'Class;
   type IEmailAttachmentFactory_Ptr is access all IEmailAttachmentFactory;
   type IEmailAttachmentFactory2_Interface;
   type IEmailAttachmentFactory2 is access all IEmailAttachmentFactory2_Interface'Class;
   type IEmailAttachmentFactory2_Ptr is access all IEmailAttachmentFactory2;
   type IEmailMailboxChangedEventArgs_Interface;
   type IEmailMailboxChangedEventArgs is access all IEmailMailboxChangedEventArgs_Interface'Class;
   type IEmailMailboxChangedEventArgs_Ptr is access all IEmailMailboxChangedEventArgs;
   type IEmailMailboxChangedDeferral_Interface;
   type IEmailMailboxChangedDeferral is access all IEmailMailboxChangedDeferral_Interface'Class;
   type IEmailMailboxChangedDeferral_Ptr is access all IEmailMailboxChangedDeferral;
   type IEmailStoreNotificationTriggerDetails_Interface;
   type IEmailStoreNotificationTriggerDetails is access all IEmailStoreNotificationTriggerDetails_Interface'Class;
   type IEmailStoreNotificationTriggerDetails_Ptr is access all IEmailStoreNotificationTriggerDetails;
   type IEmailMailboxPolicies_Interface;
   type IEmailMailboxPolicies is access all IEmailMailboxPolicies_Interface'Class;
   type IEmailMailboxPolicies_Ptr is access all IEmailMailboxPolicies;
   type IEmailMailboxPolicies2_Interface;
   type IEmailMailboxPolicies2 is access all IEmailMailboxPolicies2_Interface'Class;
   type IEmailMailboxPolicies2_Ptr is access all IEmailMailboxPolicies2;
   type IEmailMailboxPolicies3_Interface;
   type IEmailMailboxPolicies3 is access all IEmailMailboxPolicies3_Interface'Class;
   type IEmailMailboxPolicies3_Ptr is access all IEmailMailboxPolicies3;
   type IEmailMailboxCapabilities_Interface;
   type IEmailMailboxCapabilities is access all IEmailMailboxCapabilities_Interface'Class;
   type IEmailMailboxCapabilities_Ptr is access all IEmailMailboxCapabilities;
   type IEmailMailboxCapabilities2_Interface;
   type IEmailMailboxCapabilities2 is access all IEmailMailboxCapabilities2_Interface'Class;
   type IEmailMailboxCapabilities2_Ptr is access all IEmailMailboxCapabilities2;
   type IEmailMailboxCapabilities3_Interface;
   type IEmailMailboxCapabilities3 is access all IEmailMailboxCapabilities3_Interface'Class;
   type IEmailMailboxCapabilities3_Ptr is access all IEmailMailboxCapabilities3;
   type IEmailMailbox_Interface;
   type IEmailMailbox is access all IEmailMailbox_Interface'Class;
   type IEmailMailbox_Ptr is access all IEmailMailbox;
   type IEmailMailbox2_Interface;
   type IEmailMailbox2 is access all IEmailMailbox2_Interface'Class;
   type IEmailMailbox2_Ptr is access all IEmailMailbox2;
   type IEmailMailbox3_Interface;
   type IEmailMailbox3 is access all IEmailMailbox3_Interface'Class;
   type IEmailMailbox3_Ptr is access all IEmailMailbox3;
   type IEmailMailbox4_Interface;
   type IEmailMailbox4 is access all IEmailMailbox4_Interface'Class;
   type IEmailMailbox4_Ptr is access all IEmailMailbox4;
   type IEmailMailbox5_Interface;
   type IEmailMailbox5 is access all IEmailMailbox5_Interface'Class;
   type IEmailMailbox5_Ptr is access all IEmailMailbox5;
   type IEmailRecipientResolutionResult_Interface;
   type IEmailRecipientResolutionResult is access all IEmailRecipientResolutionResult_Interface'Class;
   type IEmailRecipientResolutionResult_Ptr is access all IEmailRecipientResolutionResult;
   type IEmailRecipientResolutionResult2_Interface;
   type IEmailRecipientResolutionResult2 is access all IEmailRecipientResolutionResult2_Interface'Class;
   type IEmailRecipientResolutionResult2_Ptr is access all IEmailRecipientResolutionResult2;
   type IEmailMailboxCreateFolderResult_Interface;
   type IEmailMailboxCreateFolderResult is access all IEmailMailboxCreateFolderResult_Interface'Class;
   type IEmailMailboxCreateFolderResult_Ptr is access all IEmailMailboxCreateFolderResult;
   type IEmailMailboxAutoReplySettings_Interface;
   type IEmailMailboxAutoReplySettings is access all IEmailMailboxAutoReplySettings_Interface'Class;
   type IEmailMailboxAutoReplySettings_Ptr is access all IEmailMailboxAutoReplySettings;
   type IEmailMailboxAutoReply_Interface;
   type IEmailMailboxAutoReply is access all IEmailMailboxAutoReply_Interface'Class;
   type IEmailMailboxAutoReply_Ptr is access all IEmailMailboxAutoReply;
   type IEmailMailboxSyncManager_Interface;
   type IEmailMailboxSyncManager is access all IEmailMailboxSyncManager_Interface'Class;
   type IEmailMailboxSyncManager_Ptr is access all IEmailMailboxSyncManager;
   type IEmailMailboxSyncManager2_Interface;
   type IEmailMailboxSyncManager2 is access all IEmailMailboxSyncManager2_Interface'Class;
   type IEmailMailboxSyncManager2_Ptr is access all IEmailMailboxSyncManager2;
   type IEmailFolder_Interface;
   type IEmailFolder is access all IEmailFolder_Interface'Class;
   type IEmailFolder_Ptr is access all IEmailFolder;
   type IEmailConversation_Interface;
   type IEmailConversation is access all IEmailConversation_Interface'Class;
   type IEmailConversation_Ptr is access all IEmailConversation;
   type IEmailMailboxAction_Interface;
   type IEmailMailboxAction is access all IEmailMailboxAction_Interface'Class;
   type IEmailMailboxAction_Ptr is access all IEmailMailboxAction;
   type IEmailQueryTextSearch_Interface;
   type IEmailQueryTextSearch is access all IEmailQueryTextSearch_Interface'Class;
   type IEmailQueryTextSearch_Ptr is access all IEmailQueryTextSearch;
   type IEmailQueryOptionsFactory_Interface;
   type IEmailQueryOptionsFactory is access all IEmailQueryOptionsFactory_Interface'Class;
   type IEmailQueryOptionsFactory_Ptr is access all IEmailQueryOptionsFactory;
   type IEmailQueryOptions_Interface;
   type IEmailQueryOptions is access all IEmailQueryOptions_Interface'Class;
   type IEmailQueryOptions_Ptr is access all IEmailQueryOptions;
   type IEmailConversationBatch_Interface;
   type IEmailConversationBatch is access all IEmailConversationBatch_Interface'Class;
   type IEmailConversationBatch_Ptr is access all IEmailConversationBatch;
   type IEmailConversationReader_Interface;
   type IEmailConversationReader is access all IEmailConversationReader_Interface'Class;
   type IEmailConversationReader_Ptr is access all IEmailConversationReader;
   type IEmailMessageBatch_Interface;
   type IEmailMessageBatch is access all IEmailMessageBatch_Interface'Class;
   type IEmailMessageBatch_Ptr is access all IEmailMessageBatch;
   type IEmailMessageReader_Interface;
   type IEmailMessageReader is access all IEmailMessageReader_Interface'Class;
   type IEmailMessageReader_Ptr is access all IEmailMessageReader;
   type IEmailMailboxChange_Interface;
   type IEmailMailboxChange is access all IEmailMailboxChange_Interface'Class;
   type IEmailMailboxChange_Ptr is access all IEmailMailboxChange;
   type IEmailMailboxChangeReader_Interface;
   type IEmailMailboxChangeReader is access all IEmailMailboxChangeReader_Interface'Class;
   type IEmailMailboxChangeReader_Ptr is access all IEmailMailboxChangeReader;
   type IEmailMailboxChangeTracker_Interface;
   type IEmailMailboxChangeTracker is access all IEmailMailboxChangeTracker_Interface'Class;
   type IEmailMailboxChangeTracker_Ptr is access all IEmailMailboxChangeTracker;
   type IEmailMeetingInfo_Interface;
   type IEmailMeetingInfo is access all IEmailMeetingInfo_Interface'Class;
   type IEmailMeetingInfo_Ptr is access all IEmailMeetingInfo;
   type IEmailMeetingInfo2_Interface;
   type IEmailMeetingInfo2 is access all IEmailMeetingInfo2_Interface'Class;
   type IEmailMeetingInfo2_Ptr is access all IEmailMeetingInfo2;
   type IEmailItemCounts_Interface;
   type IEmailItemCounts is access all IEmailItemCounts_Interface'Class;
   type IEmailItemCounts_Ptr is access all IEmailItemCounts;
   type IAsyncOperation_IEmailStore_Interface;
   type IAsyncOperation_IEmailStore is access all IAsyncOperation_IEmailStore_Interface'Class;
   type IAsyncOperation_IEmailStore_Ptr is access all IAsyncOperation_IEmailStore;
   type IAsyncOperation_IEmailMailbox_Interface;
   type IAsyncOperation_IEmailMailbox is access all IAsyncOperation_IEmailMailbox_Interface'Class;
   type IAsyncOperation_IEmailMailbox_Ptr is access all IAsyncOperation_IEmailMailbox;
   type IAsyncOperation_IEmailConversation_Interface;
   type IAsyncOperation_IEmailConversation is access all IAsyncOperation_IEmailConversation_Interface'Class;
   type IAsyncOperation_IEmailConversation_Ptr is access all IAsyncOperation_IEmailConversation;
   type IAsyncOperation_IEmailFolder_Interface;
   type IAsyncOperation_IEmailFolder is access all IAsyncOperation_IEmailFolder_Interface'Class;
   type IAsyncOperation_IEmailFolder_Ptr is access all IAsyncOperation_IEmailFolder;
   type IAsyncOperation_IEmailMessage_Interface;
   type IAsyncOperation_IEmailMessage is access all IAsyncOperation_IEmailMessage_Interface'Class;
   type IAsyncOperation_IEmailMessage_Ptr is access all IAsyncOperation_IEmailMessage;
   type IIterator_IEmailRecipient_Interface;
   type IIterator_IEmailRecipient is access all IIterator_IEmailRecipient_Interface'Class;
   type IIterator_IEmailRecipient_Ptr is access all IIterator_IEmailRecipient;
   type IIterable_IEmailRecipient_Interface;
   type IIterable_IEmailRecipient is access all IIterable_IEmailRecipient_Interface'Class;
   type IIterable_IEmailRecipient_Ptr is access all IIterable_IEmailRecipient;
   type IVectorView_IEmailRecipient_Interface;
   type IVectorView_IEmailRecipient is access all IVectorView_IEmailRecipient_Interface'Class;
   type IVectorView_IEmailRecipient_Ptr is access all IVectorView_IEmailRecipient;
   type IVector_IEmailRecipient_Interface;
   type IVector_IEmailRecipient is access all IVector_IEmailRecipient_Interface'Class;
   type IVector_IEmailRecipient_Ptr is access all IVector_IEmailRecipient;
   type IIterator_IEmailAttachment_Interface;
   type IIterator_IEmailAttachment is access all IIterator_IEmailAttachment_Interface'Class;
   type IIterator_IEmailAttachment_Ptr is access all IIterator_IEmailAttachment;
   type IIterable_IEmailAttachment_Interface;
   type IIterable_IEmailAttachment is access all IIterable_IEmailAttachment_Interface'Class;
   type IIterable_IEmailAttachment_Ptr is access all IIterable_IEmailAttachment;
   type IVectorView_IEmailAttachment_Interface;
   type IVectorView_IEmailAttachment is access all IVectorView_IEmailAttachment_Interface'Class;
   type IVectorView_IEmailAttachment_Ptr is access all IVectorView_IEmailAttachment;
   type IVector_IEmailAttachment_Interface;
   type IVector_IEmailAttachment is access all IVector_IEmailAttachment_Interface'Class;
   type IVector_IEmailAttachment_Ptr is access all IVector_IEmailAttachment;
   type IReference_EmailMailboxSmimeEncryptionAlgorithm_Interface;
   type IReference_EmailMailboxSmimeEncryptionAlgorithm is access all IReference_EmailMailboxSmimeEncryptionAlgorithm_Interface'Class;
   type IReference_EmailMailboxSmimeEncryptionAlgorithm_Ptr is access all IReference_EmailMailboxSmimeEncryptionAlgorithm;
   type IReference_EmailMailboxSmimeSigningAlgorithm_Interface;
   type IReference_EmailMailboxSmimeSigningAlgorithm is access all IReference_EmailMailboxSmimeSigningAlgorithm_Interface'Class;
   type IReference_EmailMailboxSmimeSigningAlgorithm_Ptr is access all IReference_EmailMailboxSmimeSigningAlgorithm;
   type IAsyncOperation_IEmailMailboxAutoReplySettings_Interface;
   type IAsyncOperation_IEmailMailboxAutoReplySettings is access all IAsyncOperation_IEmailMailboxAutoReplySettings_Interface'Class;
   type IAsyncOperation_IEmailMailboxAutoReplySettings_Ptr is access all IAsyncOperation_IEmailMailboxAutoReplySettings;
   type IAsyncOperation_EmailMailboxEmptyFolderStatus_Interface;
   type IAsyncOperation_EmailMailboxEmptyFolderStatus is access all IAsyncOperation_EmailMailboxEmptyFolderStatus_Interface'Class;
   type IAsyncOperation_EmailMailboxEmptyFolderStatus_Ptr is access all IAsyncOperation_EmailMailboxEmptyFolderStatus;
   type IAsyncOperation_IEmailMailboxCreateFolderResult_Interface;
   type IAsyncOperation_IEmailMailboxCreateFolderResult is access all IAsyncOperation_IEmailMailboxCreateFolderResult_Interface'Class;
   type IAsyncOperation_IEmailMailboxCreateFolderResult_Ptr is access all IAsyncOperation_IEmailMailboxCreateFolderResult;
   type IAsyncOperation_EmailMailboxDeleteFolderStatus_Interface;
   type IAsyncOperation_EmailMailboxDeleteFolderStatus is access all IAsyncOperation_EmailMailboxDeleteFolderStatus_Interface'Class;
   type IAsyncOperation_EmailMailboxDeleteFolderStatus_Ptr is access all IAsyncOperation_EmailMailboxDeleteFolderStatus;
   type IAsyncOperation_IEmailItemCounts_Interface;
   type IAsyncOperation_IEmailItemCounts is access all IAsyncOperation_IEmailItemCounts_Interface'Class;
   type IAsyncOperation_IEmailItemCounts_Ptr is access all IAsyncOperation_IEmailItemCounts;
   type IIterator_IEmailConversation_Interface;
   type IIterator_IEmailConversation is access all IIterator_IEmailConversation_Interface'Class;
   type IIterator_IEmailConversation_Ptr is access all IIterator_IEmailConversation;
   type IIterable_IEmailConversation_Interface;
   type IIterable_IEmailConversation is access all IIterable_IEmailConversation_Interface'Class;
   type IIterable_IEmailConversation_Ptr is access all IIterable_IEmailConversation;
   type IVectorView_IEmailConversation_Interface;
   type IVectorView_IEmailConversation is access all IVectorView_IEmailConversation_Interface'Class;
   type IVectorView_IEmailConversation_Ptr is access all IVectorView_IEmailConversation;
   type IAsyncOperation_IEmailConversationBatch_Interface;
   type IAsyncOperation_IEmailConversationBatch is access all IAsyncOperation_IEmailConversationBatch_Interface'Class;
   type IAsyncOperation_IEmailConversationBatch_Ptr is access all IAsyncOperation_IEmailConversationBatch;
   type IIterator_IEmailMessage_Interface;
   type IIterator_IEmailMessage is access all IIterator_IEmailMessage_Interface'Class;
   type IIterator_IEmailMessage_Ptr is access all IIterator_IEmailMessage;
   type IIterable_IEmailMessage_Interface;
   type IIterable_IEmailMessage is access all IIterable_IEmailMessage_Interface'Class;
   type IIterable_IEmailMessage_Ptr is access all IIterable_IEmailMessage;
   type IVectorView_IEmailMessage_Interface;
   type IVectorView_IEmailMessage is access all IVectorView_IEmailMessage_Interface'Class;
   type IVectorView_IEmailMessage_Ptr is access all IVectorView_IEmailMessage;
   type IAsyncOperation_IEmailMessageBatch_Interface;
   type IAsyncOperation_IEmailMessageBatch is access all IAsyncOperation_IEmailMessageBatch_Interface'Class;
   type IAsyncOperation_IEmailMessageBatch_Ptr is access all IAsyncOperation_IEmailMessageBatch;
   type IIterator_IEmailMailboxAction_Interface;
   type IIterator_IEmailMailboxAction is access all IIterator_IEmailMailboxAction_Interface'Class;
   type IIterator_IEmailMailboxAction_Ptr is access all IIterator_IEmailMailboxAction;
   type IIterable_IEmailMailboxAction_Interface;
   type IIterable_IEmailMailboxAction is access all IIterable_IEmailMailboxAction_Interface'Class;
   type IIterable_IEmailMailboxAction_Ptr is access all IIterable_IEmailMailboxAction;
   type IVectorView_IEmailMailboxAction_Interface;
   type IVectorView_IEmailMailboxAction is access all IVectorView_IEmailMailboxAction_Interface'Class;
   type IVectorView_IEmailMailboxAction_Ptr is access all IVectorView_IEmailMailboxAction;
   type IVector_IEmailMailboxAction_Interface;
   type IVector_IEmailMailboxAction is access all IVector_IEmailMailboxAction_Interface'Class;
   type IVector_IEmailMailboxAction_Ptr is access all IVector_IEmailMailboxAction;
   type IIterator_IEmailRecipientResolutionResult_Interface;
   type IIterator_IEmailRecipientResolutionResult is access all IIterator_IEmailRecipientResolutionResult_Interface'Class;
   type IIterator_IEmailRecipientResolutionResult_Ptr is access all IIterator_IEmailRecipientResolutionResult;
   type IIterable_IEmailRecipientResolutionResult_Interface;
   type IIterable_IEmailRecipientResolutionResult is access all IIterable_IEmailRecipientResolutionResult_Interface'Class;
   type IIterable_IEmailRecipientResolutionResult_Ptr is access all IIterable_IEmailRecipientResolutionResult;
   type IIterator_EmailCertificateValidationStatus_Interface;
   type IIterator_EmailCertificateValidationStatus is access all IIterator_EmailCertificateValidationStatus_Interface'Class;
   type IIterator_EmailCertificateValidationStatus_Ptr is access all IIterator_EmailCertificateValidationStatus;
   type IIterable_EmailCertificateValidationStatus_Interface;
   type IIterable_EmailCertificateValidationStatus is access all IIterable_EmailCertificateValidationStatus_Interface'Class;
   type IIterable_EmailCertificateValidationStatus_Ptr is access all IIterable_EmailCertificateValidationStatus;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IEmailManagerStatics : aliased constant Windows.IID := (4111631956, 21957, 18576, (168, 36, 33, 108, 38, 24, 206, 127 ));
   
   type IEmailManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowComposeNewEmailAsync
   (
      This       : access IEmailManagerStatics_Interface
      ; message : Windows.ApplicationModel.Email.IEmailMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailManagerStatics2 : aliased constant Windows.IID := (2886020515, 45460, 16989, (182, 217, 208, 240, 65, 53, 237, 162 ));
   
   type IEmailManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStoreAsync
   (
      This       : access IEmailManagerStatics2_Interface
      ; accessType : Windows.ApplicationModel.Email.EmailStoreAccessType
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailManagerStatics3 : aliased constant Windows.IID := (1248994197, 33854, 18757, (179, 170, 52, 158, 7, 163, 98, 197 ));
   
   type IEmailManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IEmailManagerStatics3_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.ApplicationModel.Email.IEmailManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailManagerForUser : aliased constant Windows.IID := (4151565983, 15525, 19215, (144, 193, 21, 110, 64, 23, 76, 229 ));
   
   type IEmailManagerForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowComposeNewEmailAsync
   (
      This       : access IEmailManagerForUser_Interface
      ; message : Windows.ApplicationModel.Email.IEmailMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RequestStoreAsync
   (
      This       : access IEmailManagerForUser_Interface
      ; accessType : Windows.ApplicationModel.Email.EmailStoreAccessType
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IEmailManagerForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailStore : aliased constant Windows.IID := (4160954990, 37175, 20363, (164, 112, 39, 154, 195, 5, 142, 182 ));
   
   type IEmailStore_Interface is interface and Windows.IInspectable_Interface;
   
   function FindMailboxesAsync
   (
      This       : access IEmailStore_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationReader
   (
      This       : access IEmailStore_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailConversationReader
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationReaderWithOptions
   (
      This       : access IEmailStore_Interface
      ; options : Windows.ApplicationModel.Email.IEmailQueryOptions
      ; RetVal : access Windows.ApplicationModel.Email.IEmailConversationReader
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageReader
   (
      This       : access IEmailStore_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessageReader
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageReaderWithOptions
   (
      This       : access IEmailStore_Interface
      ; options : Windows.ApplicationModel.Email.IEmailQueryOptions
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessageReader
   )
   return Windows.HRESULT is abstract;
   
   function GetMailboxAsync
   (
      This       : access IEmailStore_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailbox -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationAsync
   (
      This       : access IEmailStore_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailConversation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFolderAsync
   (
      This       : access IEmailStore_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageAsync
   (
      This       : access IEmailStore_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateMailboxAsync
   (
      This       : access IEmailStore_Interface
      ; accountName : Windows.String
      ; accountAddress : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailbox -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateMailboxInAccountAsync
   (
      This       : access IEmailStore_Interface
      ; accountName : Windows.String
      ; accountAddress : Windows.String
      ; userDataAccountId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailbox -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailRecipient : aliased constant Windows.IID := (3404211635, 17528, 18452, (185, 0, 201, 2, 181, 225, 155, 83 ));
   
   type IEmailRecipient_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IEmailRecipient_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IEmailRecipient_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Address
   (
      This       : access IEmailRecipient_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Address
   (
      This       : access IEmailRecipient_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailRecipientFactory : aliased constant Windows.IID := (1426110541, 51098, 20216, (185, 9, 114, 46, 24, 227, 147, 93 ));
   
   type IEmailRecipientFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IEmailRecipientFactory_Interface
      ; address : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithName
   (
      This       : access IEmailRecipientFactory_Interface
      ; address : Windows.String
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailIrmTemplate : aliased constant Windows.IID := (4079449485, 21613, 19434, (169, 99, 84, 163, 139, 44, 192, 22 ));
   
   type IEmailIrmTemplate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IEmailIrmTemplate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IEmailIrmTemplate_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IEmailIrmTemplate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IEmailIrmTemplate_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IEmailIrmTemplate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IEmailIrmTemplate_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailIrmTemplateFactory : aliased constant Windows.IID := (1034098806, 34616, 17432, (185, 203, 71, 27, 147, 111, 231, 30 ));
   
   type IEmailIrmTemplateFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IEmailIrmTemplateFactory_Interface
      ; id : Windows.String
      ; name : Windows.String
      ; description : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IEmailIrmTemplate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailIrmInfo : aliased constant Windows.IID := (2431984019, 45472, 20157, (166, 182, 221, 202, 85, 96, 110, 14 ));
   
   type IEmailIrmInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanEdit
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanEdit
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanExtractData
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanExtractData
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanForward
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanForward
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanModifyRecipientsOnResponse
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanModifyRecipientsOnResponse
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanPrintData
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanPrintData
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRemoveIrmOnResponse
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanRemoveIrmOnResponse
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanReply
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanReply
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanReplyAll
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanReplyAll
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationDate
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_ExpirationDate
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_IsIrmOriginator
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsIrmOriginator
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsProgramaticAccessAllowed
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsProgramaticAccessAllowed
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Template
   (
      This       : access IEmailIrmInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailIrmTemplate
   )
   return Windows.HRESULT is abstract;
   
   function put_Template
   (
      This       : access IEmailIrmInfo_Interface
      ; value : Windows.ApplicationModel.Email.IEmailIrmTemplate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailIrmInfoFactory : aliased constant Windows.IID := (827044236, 58342, 19835, (190, 141, 145, 169, 99, 17, 176, 27 ));
   
   type IEmailIrmInfoFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IEmailIrmInfoFactory_Interface
      ; expiration : Windows.Foundation.DateTime
      ; irmTemplate : Windows.ApplicationModel.Email.IEmailIrmTemplate
      ; RetVal : access Windows.ApplicationModel.Email.IEmailIrmInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMessage : aliased constant Windows.IID := (1819120781, 32949, 18680, (176, 177, 224, 78, 67, 15, 68, 229 ));
   
   type IEmailMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Subject
   (
      This       : access IEmailMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Subject
   (
      This       : access IEmailMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Body
   (
      This       : access IEmailMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Body
   (
      This       : access IEmailMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_To
   (
      This       : access IEmailMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVector_IEmailRecipient -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CC
   (
      This       : access IEmailMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVector_IEmailRecipient -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Bcc
   (
      This       : access IEmailMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVector_IEmailRecipient -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Attachments
   (
      This       : access IEmailMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVector_IEmailAttachment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMessage2 : aliased constant Windows.IID := (4257752203, 40730, 17627, (189, 60, 101, 195, 132, 119, 15, 134 ));
   
   type IEmailMessage2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MailboxId
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ConversationId
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FolderId
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowInternetImages
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowInternetImages
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ChangeNumber
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_DownloadState
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMessageDownloadState
   )
   return Windows.HRESULT is abstract;
   
   function put_DownloadState
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.ApplicationModel.Email.EmailMessageDownloadState
   )
   return Windows.HRESULT is abstract;
   
   function get_EstimatedDownloadSizeInBytes
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_EstimatedDownloadSizeInBytes
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_FlagState
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailFlagState
   )
   return Windows.HRESULT is abstract;
   
   function put_FlagState
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.ApplicationModel.Email.EmailFlagState
   )
   return Windows.HRESULT is abstract;
   
   function get_HasPartialBodies
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Importance
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailImportance
   )
   return Windows.HRESULT is abstract;
   
   function put_Importance
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.ApplicationModel.Email.EmailImportance
   )
   return Windows.HRESULT is abstract;
   
   function get_InResponseToMessageId
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IrmInfo
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailIrmInfo
   )
   return Windows.HRESULT is abstract;
   
   function put_IrmInfo
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.ApplicationModel.Email.IEmailIrmInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDraftMessage
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRead
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsRead
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSeen
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSeen
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsServerSearchMessage
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSmartSendable
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageClass
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MessageClass
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizedSubject
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginalCodePage
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_OriginalCodePage
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Preview
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Preview
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LastResponseKind
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMessageResponseKind
   )
   return Windows.HRESULT is abstract;
   
   function put_LastResponseKind
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.ApplicationModel.Email.EmailMessageResponseKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Sender
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function put_Sender
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function get_SentTime
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_SentTime
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_MeetingInfo
   (
      This       : access IEmailMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMeetingInfo
   )
   return Windows.HRESULT is abstract;
   
   function put_MeetingInfo
   (
      This       : access IEmailMessage2_Interface
      ; value : Windows.ApplicationModel.Email.IEmailMeetingInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetBodyStream
   (
      This       : access IEmailMessage2_Interface
      ; type_x : Windows.ApplicationModel.Email.EmailMessageBodyKind
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function SetBodyStream
   (
      This       : access IEmailMessage2_Interface
      ; type_x : Windows.ApplicationModel.Email.EmailMessageBodyKind
      ; stream : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMessage3 : aliased constant Windows.IID := (2716493660, 58776, 19753, (160, 24, 252, 123, 126, 236, 224, 161 ));
   
   type IEmailMessage3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SmimeData
   (
      This       : access IEmailMessage3_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_SmimeData
   (
      This       : access IEmailMessage3_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_SmimeKind
   (
      This       : access IEmailMessage3_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMessageSmimeKind
   )
   return Windows.HRESULT is abstract;
   
   function put_SmimeKind
   (
      This       : access IEmailMessage3_Interface
      ; value : Windows.ApplicationModel.Email.EmailMessageSmimeKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMessage4 : aliased constant Windows.IID := (830271873, 15999, 18949, (131, 148, 62, 16, 51, 109, 212, 53 ));
   
   type IEmailMessage4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ReplyTo
   (
      This       : access IEmailMessage4_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVector_IEmailRecipient -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SentRepresenting
   (
      This       : access IEmailMessage4_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function put_SentRepresenting
   (
      This       : access IEmailMessage4_Interface
      ; value : Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailAttachment : aliased constant Windows.IID := (4082354937, 22472, 19163, (185, 146, 96, 252, 235, 88, 79, 84 ));
   
   type IEmailAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FileName
   (
      This       : access IEmailAttachment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_FileName
   (
      This       : access IEmailAttachment_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IEmailAttachment_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IEmailAttachment_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailAttachment2 : aliased constant Windows.IID := (576655472, 45311, 17777, (157, 84, 167, 6, 196, 141, 85, 198 ));
   
   type IEmailAttachment2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IEmailAttachment2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentId
   (
      This       : access IEmailAttachment2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentId
   (
      This       : access IEmailAttachment2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentLocation
   (
      This       : access IEmailAttachment2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentLocation
   (
      This       : access IEmailAttachment2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DownloadState
   (
      This       : access IEmailAttachment2_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailAttachmentDownloadState
   )
   return Windows.HRESULT is abstract;
   
   function put_DownloadState
   (
      This       : access IEmailAttachment2_Interface
      ; value : Windows.ApplicationModel.Email.EmailAttachmentDownloadState
   )
   return Windows.HRESULT is abstract;
   
   function get_EstimatedDownloadSizeInBytes
   (
      This       : access IEmailAttachment2_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_EstimatedDownloadSizeInBytes
   (
      This       : access IEmailAttachment2_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFromBaseMessage
   (
      This       : access IEmailAttachment2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInline
   (
      This       : access IEmailAttachment2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsInline
   (
      This       : access IEmailAttachment2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MimeType
   (
      This       : access IEmailAttachment2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MimeType
   (
      This       : access IEmailAttachment2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailAttachmentFactory : aliased constant Windows.IID := (2037296198, 60758, 18809, (135, 8, 171, 184, 188, 133, 75, 125 ));
   
   type IEmailAttachmentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IEmailAttachmentFactory_Interface
      ; fileName : Windows.String
      ; data : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.ApplicationModel.Email.IEmailAttachment
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailAttachmentFactory2 : aliased constant Windows.IID := (589665333, 20985, 17021, (173, 205, 36, 16, 35, 200, 207, 183 ));
   
   type IEmailAttachmentFactory2_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IEmailAttachmentFactory2_Interface
      ; fileName : Windows.String
      ; data : Windows.Storage.Streams.IRandomAccessStreamReference
      ; mimeType : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IEmailAttachment
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxChangedEventArgs : aliased constant Windows.IID := (1023237998, 468, 20042, (164, 76, 178, 45, 212, 46, 194, 7 ));
   
   type IEmailMailboxChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IEmailMailboxChangedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxChangedDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxChangedDeferral : aliased constant Windows.IID := (2006611137, 38853, 19284, (179, 13, 48, 98, 50, 98, 62, 109 ));
   
   type IEmailMailboxChangedDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IEmailMailboxChangedDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailStoreNotificationTriggerDetails : aliased constant Windows.IID := (3457635900, 18150, 17353, (150, 247, 250, 207, 125, 215, 16, 203 ));
   
   type IEmailStoreNotificationTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxPolicies : aliased constant Windows.IID := (523453893, 7227, 19911, (180, 16, 99, 115, 120, 62, 84, 93 ));
   
   type IEmailMailboxPolicies_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowedSmimeEncryptionAlgorithmNegotiation
   (
      This       : access IEmailMailboxPolicies_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowSmimeSoftCertificates
   (
      This       : access IEmailMailboxPolicies_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RequiredSmimeEncryptionAlgorithm
   (
      This       : access IEmailMailboxPolicies_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IReference_EmailMailboxSmimeEncryptionAlgorithm -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RequiredSmimeSigningAlgorithm
   (
      This       : access IEmailMailboxPolicies_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IReference_EmailMailboxSmimeSigningAlgorithm -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxPolicies2 : aliased constant Windows.IID := (3132459771, 41291, 18812, (168, 226, 85, 234, 194, 156, 196, 181 ));
   
   type IEmailMailboxPolicies2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MustEncryptSmimeMessages
   (
      This       : access IEmailMailboxPolicies2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MustSignSmimeMessages
   (
      This       : access IEmailMailboxPolicies2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxPolicies3 : aliased constant Windows.IID := (3184828447, 18535, 16714, (129, 162, 128, 57, 25, 196, 65, 145 ));
   
   type IEmailMailboxPolicies3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_AllowedSmimeEncryptionAlgorithmNegotiation
   (
      This       : access IEmailMailboxPolicies3_Interface
      ; value : Windows.ApplicationModel.Email.EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowSmimeSoftCertificates
   (
      This       : access IEmailMailboxPolicies3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RequiredSmimeEncryptionAlgorithm
   (
      This       : access IEmailMailboxPolicies3_Interface
      ; value : Windows.ApplicationModel.Email.IReference_EmailMailboxSmimeEncryptionAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function put_RequiredSmimeSigningAlgorithm
   (
      This       : access IEmailMailboxPolicies3_Interface
      ; value : Windows.ApplicationModel.Email.IReference_EmailMailboxSmimeSigningAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function put_MustEncryptSmimeMessages
   (
      This       : access IEmailMailboxPolicies3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_MustSignSmimeMessages
   (
      This       : access IEmailMailboxPolicies3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxCapabilities : aliased constant Windows.IID := (4007576486, 35291, 17157, (130, 196, 67, 158, 10, 51, 218, 17 ));
   
   type IEmailMailboxCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanForwardMeetings
   (
      This       : access IEmailMailboxCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanGetAndSetExternalAutoReplies
   (
      This       : access IEmailMailboxCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanGetAndSetInternalAutoReplies
   (
      This       : access IEmailMailboxCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanUpdateMeetingResponses
   (
      This       : access IEmailMailboxCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanServerSearchFolders
   (
      This       : access IEmailMailboxCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanServerSearchMailbox
   (
      This       : access IEmailMailboxCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanProposeNewTimeForMeetings
   (
      This       : access IEmailMailboxCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanSmartSend
   (
      This       : access IEmailMailboxCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxCapabilities2 : aliased constant Windows.IID := (1769094884, 12065, 19644, (136, 171, 46, 118, 2, 164, 128, 107 ));
   
   type IEmailMailboxCapabilities2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanResolveRecipients
   (
      This       : access IEmailMailboxCapabilities2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanValidateCertificates
   (
      This       : access IEmailMailboxCapabilities2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanEmptyFolder
   (
      This       : access IEmailMailboxCapabilities2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanCreateFolder
   (
      This       : access IEmailMailboxCapabilities2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanDeleteFolder
   (
      This       : access IEmailMailboxCapabilities2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanMoveFolder
   (
      This       : access IEmailMailboxCapabilities2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxCapabilities3 : aliased constant Windows.IID := (4136692036, 22258, 17834, (135, 44, 12, 233, 243, 219, 11, 92 ));
   
   type IEmailMailboxCapabilities3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_CanForwardMeetings
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanGetAndSetExternalAutoReplies
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanGetAndSetInternalAutoReplies
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanUpdateMeetingResponses
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanServerSearchFolders
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanServerSearchMailbox
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanProposeNewTimeForMeetings
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanSmartSend
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanResolveRecipients
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanValidateCertificates
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanEmptyFolder
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanCreateFolder
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanDeleteFolder
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanMoveFolder
   (
      This       : access IEmailMailboxCapabilities3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailbox : aliased constant Windows.IID := (2826503753, 53083, 16667, (128, 177, 74, 106, 20, 132, 206, 37 ));
   
   type IEmailMailbox_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Capabilities
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_ChangeTracker
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxChangeTracker
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IEmailMailbox_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOwnedByCurrentApp
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDataEncryptedUnderLock
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MailAddress
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MailAddress
   (
      This       : access IEmailMailbox_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MailAddressAliases
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherAppReadAccess
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function put_OtherAppReadAccess
   (
      This       : access IEmailMailbox_Interface
      ; value : Windows.ApplicationModel.Email.EmailMailboxOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherAppWriteAccess
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxOtherAppWriteAccess
   )
   return Windows.HRESULT is abstract;
   
   function put_OtherAppWriteAccess
   (
      This       : access IEmailMailbox_Interface
      ; value : Windows.ApplicationModel.Email.EmailMailboxOtherAppWriteAccess
   )
   return Windows.HRESULT is abstract;
   
   function get_Policies
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxPolicies
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceDisplayName
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SyncManager
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxSyncManager
   )
   return Windows.HRESULT is abstract;
   
   function get_UserDataAccountId
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationReader
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailConversationReader
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationReaderWithOptions
   (
      This       : access IEmailMailbox_Interface
      ; options : Windows.ApplicationModel.Email.IEmailQueryOptions
      ; RetVal : access Windows.ApplicationModel.Email.IEmailConversationReader
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageReader
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessageReader
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageReaderWithOptions
   (
      This       : access IEmailMailbox_Interface
      ; options : Windows.ApplicationModel.Email.IEmailQueryOptions
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessageReader
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationAsync
   (
      This       : access IEmailMailbox_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailConversation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFolderAsync
   (
      This       : access IEmailMailbox_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageAsync
   (
      This       : access IEmailMailbox_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSpecialFolderAsync
   (
      This       : access IEmailMailbox_Interface
      ; folderType : Windows.ApplicationModel.Email.EmailSpecialFolderKind
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IEmailMailbox_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MarkMessageAsSeenAsync
   (
      This       : access IEmailMailbox_Interface
      ; messageId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MarkFolderAsSeenAsync
   (
      This       : access IEmailMailbox_Interface
      ; folderId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MarkMessageReadAsync
   (
      This       : access IEmailMailbox_Interface
      ; messageId : Windows.String
      ; isRead : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ChangeMessageFlagStateAsync
   (
      This       : access IEmailMailbox_Interface
      ; messageId : Windows.String
      ; flagState : Windows.ApplicationModel.Email.EmailFlagState
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function TryMoveMessageAsync
   (
      This       : access IEmailMailbox_Interface
      ; messageId : Windows.String
      ; newParentFolderId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryMoveFolderAsync
   (
      This       : access IEmailMailbox_Interface
      ; folderId : Windows.String
      ; newParentFolderId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryMoveFolderWithNewNameAsync
   (
      This       : access IEmailMailbox_Interface
      ; folderId : Windows.String
      ; newParentFolderId : Windows.String
      ; newFolderName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteMessageAsync
   (
      This       : access IEmailMailbox_Interface
      ; messageId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MarkFolderSyncEnabledAsync
   (
      This       : access IEmailMailbox_Interface
      ; folderId : Windows.String
      ; isSyncEnabled : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SendMessageAsync
   (
      This       : access IEmailMailbox_Interface
      ; message : Windows.ApplicationModel.Email.IEmailMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SaveDraftAsync
   (
      This       : access IEmailMailbox_Interface
      ; message : Windows.ApplicationModel.Email.IEmailMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DownloadMessageAsync
   (
      This       : access IEmailMailbox_Interface
      ; messageId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DownloadAttachmentAsync
   (
      This       : access IEmailMailbox_Interface
      ; attachmentId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CreateResponseMessageAsync
   (
      This       : access IEmailMailbox_Interface
      ; messageId : Windows.String
      ; responseType : Windows.ApplicationModel.Email.EmailMessageResponseKind
      ; subject : Windows.String
      ; responseHeaderType : Windows.ApplicationModel.Email.EmailMessageBodyKind
      ; responseHeader : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdateMeetingResponseAsync
   (
      This       : access IEmailMailbox_Interface
      ; meeting : Windows.ApplicationModel.Email.IEmailMessage
      ; response : Windows.ApplicationModel.Email.EmailMeetingResponseType
      ; subject : Windows.String
      ; comment : Windows.String
      ; sendUpdate : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryForwardMeetingAsync
   (
      This       : access IEmailMailbox_Interface
      ; meeting : Windows.ApplicationModel.Email.IEmailMessage
      ; recipients : Windows.ApplicationModel.Email.IIterable_IEmailRecipient
      ; subject : Windows.String
      ; forwardHeaderType : Windows.ApplicationModel.Email.EmailMessageBodyKind
      ; forwardHeader : Windows.String
      ; comment : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryProposeNewTimeForMeetingAsync
   (
      This       : access IEmailMailbox_Interface
      ; meeting : Windows.ApplicationModel.Email.IEmailMessage
      ; newStartTime : Windows.Foundation.DateTime
      ; newDuration : Windows.Foundation.TimeSpan
      ; subject : Windows.String
      ; comment : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_MailboxChanged
   (
      This       : access IEmailMailbox_Interface
      ; pHandler : TypedEventHandler_IEmailMailbox_add_MailboxChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MailboxChanged
   (
      This       : access IEmailMailbox_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function SmartSendMessageAsync
   (
      This       : access IEmailMailbox_Interface
      ; message : Windows.ApplicationModel.Email.IEmailMessage
      ; smartSend : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function TrySetAutoReplySettingsAsync
   (
      This       : access IEmailMailbox_Interface
      ; autoReplySettings : Windows.ApplicationModel.Email.IEmailMailboxAutoReplySettings
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryGetAutoReplySettingsAsync
   (
      This       : access IEmailMailbox_Interface
      ; requestedFormat : Windows.ApplicationModel.Email.EmailMailboxAutoReplyMessageResponseKind
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailboxAutoReplySettings -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailbox2 : aliased constant Windows.IID := (351855620, 27810, 19122, (146, 65, 121, 205, 123, 244, 99, 70 ));
   
   type IEmailMailbox2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LinkedMailboxId
   (
      This       : access IEmailMailbox2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkAccountId
   (
      This       : access IEmailMailbox2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkId
   (
      This       : access IEmailMailbox2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailbox3 : aliased constant Windows.IID := (1034258811, 17803, 16522, (142, 55, 172, 139, 5, 216, 175, 86 ));
   
   type IEmailMailbox3_Interface is interface and Windows.IInspectable_Interface;
   
   function ResolveRecipientsAsync
   (
      This       : access IEmailMailbox3_Interface
      ; recipients : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ValidateCertificatesAsync
   (
      This       : access IEmailMailbox3_Interface
      ; certificates : Windows.Security.Cryptography.Certificates.IIterable_ICertificate
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryEmptyFolderAsync
   (
      This       : access IEmailMailbox3_Interface
      ; folderId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_EmailMailboxEmptyFolderStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateFolderAsync
   (
      This       : access IEmailMailbox3_Interface
      ; parentFolderId : Windows.String
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailboxCreateFolderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDeleteFolderAsync
   (
      This       : access IEmailMailbox3_Interface
      ; folderId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_EmailMailboxDeleteFolderStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailbox4 : aliased constant Windows.IID := (1562325019, 61986, 18599, (183, 182, 113, 99, 86, 205, 38, 161 ));
   
   type IEmailMailbox4_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterSyncManagerAsync
   (
      This       : access IEmailMailbox4_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailbox5 : aliased constant Windows.IID := (966160519, 146, 18878, (189, 14, 93, 77, 201, 217, 109, 144 ));
   
   type IEmailMailbox5_Interface is interface and Windows.IInspectable_Interface;
   
   function GetChangeTracker
   (
      This       : access IEmailMailbox5_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxChangeTracker
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailRecipientResolutionResult : aliased constant Windows.IID := (2441296122, 36237, 17779, (128, 209, 7, 23, 42, 52, 185, 141 ));
   
   type IEmailRecipientResolutionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IEmailRecipientResolutionResult_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailRecipientResolutionStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_PublicKeys
   (
      This       : access IEmailRecipientResolutionResult_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailRecipientResolutionResult2 : aliased constant Windows.IID := (1581386678, 52827, 19422, (185, 212, 225, 109, 160, 176, 159, 202 ));
   
   type IEmailRecipientResolutionResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Status
   (
      This       : access IEmailRecipientResolutionResult2_Interface
      ; value : Windows.ApplicationModel.Email.EmailRecipientResolutionStatus
   )
   return Windows.HRESULT is abstract;
   
   function SetPublicKeys
   (
      This       : access IEmailRecipientResolutionResult2_Interface
      ; value : Windows.Security.Cryptography.Certificates.IIterable_ICertificate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxCreateFolderResult : aliased constant Windows.IID := (2988987775, 10373, 18840, (181, 149, 138, 45, 55, 76, 233, 80 ));
   
   type IEmailMailboxCreateFolderResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IEmailMailboxCreateFolderResult_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxCreateFolderStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Folder
   (
      This       : access IEmailMailboxCreateFolderResult_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailFolder
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxAutoReplySettings : aliased constant Windows.IID := (2826608552, 2758, 19319, (186, 119, 166, 185, 158, 154, 39, 184 ));
   
   type IEmailMailboxAutoReplySettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabled
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseKind
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxAutoReplyMessageResponseKind
   )
   return Windows.HRESULT is abstract;
   
   function put_ResponseKind
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; value : Windows.ApplicationModel.Email.EmailMailboxAutoReplyMessageResponseKind
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTime
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_StartTime
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_EndTime
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_EndTime
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_InternalReply
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxAutoReply
   )
   return Windows.HRESULT is abstract;
   
   function get_KnownExternalReply
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxAutoReply
   )
   return Windows.HRESULT is abstract;
   
   function get_UnknownExternalReply
   (
      This       : access IEmailMailboxAutoReplySettings_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxAutoReply
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxAutoReply : aliased constant Windows.IID := (3793954124, 35508, 18523, (179, 31, 4, 209, 84, 118, 189, 89 ));
   
   type IEmailMailboxAutoReply_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabled
   (
      This       : access IEmailMailboxAutoReply_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access IEmailMailboxAutoReply_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Response
   (
      This       : access IEmailMailboxAutoReply_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Response
   (
      This       : access IEmailMailboxAutoReply_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxSyncManager : aliased constant Windows.IID := (1367000410, 13713, 19293, (133, 188, 199, 29, 222, 134, 34, 99 ));
   
   type IEmailMailboxSyncManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IEmailMailboxSyncManager_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxSyncStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_LastSuccessfulSyncTime
   (
      This       : access IEmailMailboxSyncManager_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_LastAttemptedSyncTime
   (
      This       : access IEmailMailboxSyncManager_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function SyncAsync
   (
      This       : access IEmailMailboxSyncManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_SyncStatusChanged
   (
      This       : access IEmailMailboxSyncManager_Interface
      ; handler : TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SyncStatusChanged
   (
      This       : access IEmailMailboxSyncManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxSyncManager2 : aliased constant Windows.IID := (3448621438, 38337, 20361, (129, 183, 230, 174, 203, 102, 149, 252 ));
   
   type IEmailMailboxSyncManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Status
   (
      This       : access IEmailMailboxSyncManager2_Interface
      ; value : Windows.ApplicationModel.Email.EmailMailboxSyncStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_LastSuccessfulSyncTime
   (
      This       : access IEmailMailboxSyncManager2_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_LastAttemptedSyncTime
   (
      This       : access IEmailMailboxSyncManager2_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailFolder : aliased constant Windows.IID := (2723116913, 39276, 18532, (177, 186, 237, 18, 64, 229, 125, 17 ));
   
   type IEmailFolder_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access IEmailFolder_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MailboxId
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ParentFolderId
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IEmailFolder_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSyncEnabled
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSyncEnabled
   (
      This       : access IEmailFolder_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LastSuccessfulSyncTime
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_LastSuccessfulSyncTime
   (
      This       : access IEmailFolder_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailSpecialFolderKind
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderAsync
   (
      This       : access IEmailFolder_Interface
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function FindChildFoldersAsync
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationReader
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailConversationReader
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationReaderWithOptions
   (
      This       : access IEmailFolder_Interface
      ; options : Windows.ApplicationModel.Email.IEmailQueryOptions
      ; RetVal : access Windows.ApplicationModel.Email.IEmailConversationReader
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageAsync
   (
      This       : access IEmailFolder_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageReader
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessageReader
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageReaderWithOptions
   (
      This       : access IEmailFolder_Interface
      ; options : Windows.ApplicationModel.Email.IEmailQueryOptions
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessageReader
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageCountsAsync
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailItemCounts -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryMoveAsync
   (
      This       : access IEmailFolder_Interface
      ; newParentFolder : Windows.ApplicationModel.Email.IEmailFolder
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryMoveWithNewNameAsync
   (
      This       : access IEmailFolder_Interface
      ; newParentFolder : Windows.ApplicationModel.Email.IEmailFolder
      ; newFolderName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySaveAsync
   (
      This       : access IEmailFolder_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveMessageAsync
   (
      This       : access IEmailFolder_Interface
      ; message : Windows.ApplicationModel.Email.IEmailMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailConversation : aliased constant Windows.IID := (3659055688, 41148, 17225, (144, 45, 144, 246, 99, 137, 245, 27 ));
   
   type IEmailConversation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MailboxId
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FlagState
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailFlagState
   )
   return Windows.HRESULT is abstract;
   
   function get_HasAttachment
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Importance
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailImportance
   )
   return Windows.HRESULT is abstract;
   
   function get_LastEmailResponseKind
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMessageResponseKind
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageCount
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MostRecentMessageId
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MostRecentMessageTime
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Preview
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LatestSender
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UnreadMessageCount
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function FindMessagesAsync
   (
      This       : access IEmailConversation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindMessagesWithCountAsync
   (
      This       : access IEmailConversation_Interface
      ; count : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxAction : aliased constant Windows.IID := (2895677946, 8698, 18727, (146, 16, 212, 16, 88, 47, 223, 62 ));
   
   type IEmailMailboxAction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IEmailMailboxAction_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxActionKind
   )
   return Windows.HRESULT is abstract;
   
   function get_ChangeNumber
   (
      This       : access IEmailMailboxAction_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailQueryTextSearch : aliased constant Windows.IID := (2678104712, 15453, 18085, (166, 226, 49, 214, 253, 23, 229, 64 ));
   
   type IEmailQueryTextSearch_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Fields
   (
      This       : access IEmailQueryTextSearch_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailQuerySearchFields
   )
   return Windows.HRESULT is abstract;
   
   function put_Fields
   (
      This       : access IEmailQueryTextSearch_Interface
      ; value : Windows.ApplicationModel.Email.EmailQuerySearchFields
   )
   return Windows.HRESULT is abstract;
   
   function get_SearchScope
   (
      This       : access IEmailQueryTextSearch_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailQuerySearchScope
   )
   return Windows.HRESULT is abstract;
   
   function put_SearchScope
   (
      This       : access IEmailQueryTextSearch_Interface
      ; value : Windows.ApplicationModel.Email.EmailQuerySearchScope
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IEmailQueryTextSearch_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access IEmailQueryTextSearch_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailQueryOptionsFactory : aliased constant Windows.IID := (2297536952, 30891, 20200, (180, 227, 4, 109, 110, 47, 229, 226 ));
   
   type IEmailQueryOptionsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithText
   (
      This       : access IEmailQueryOptionsFactory_Interface
      ; text : Windows.String
      ; RetVal : access Windows.ApplicationModel.Email.IEmailQueryOptions
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithTextAndFields
   (
      This       : access IEmailQueryOptionsFactory_Interface
      ; text : Windows.String
      ; fields : Windows.ApplicationModel.Email.EmailQuerySearchFields
      ; RetVal : access Windows.ApplicationModel.Email.IEmailQueryOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailQueryOptions : aliased constant Windows.IID := (1162890139, 15999, 19794, (182, 221, 214, 253, 78, 31, 189, 154 ));
   
   type IEmailQueryOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextSearch
   (
      This       : access IEmailQueryOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailQueryTextSearch
   )
   return Windows.HRESULT is abstract;
   
   function get_SortDirection
   (
      This       : access IEmailQueryOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailQuerySortDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_SortDirection
   (
      This       : access IEmailQueryOptions_Interface
      ; value : Windows.ApplicationModel.Email.EmailQuerySortDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_SortProperty
   (
      This       : access IEmailQueryOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailQuerySortProperty
   )
   return Windows.HRESULT is abstract;
   
   function put_SortProperty
   (
      This       : access IEmailQueryOptions_Interface
      ; value : Windows.ApplicationModel.Email.EmailQuerySortProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IEmailQueryOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailQueryKind
   )
   return Windows.HRESULT is abstract;
   
   function put_Kind
   (
      This       : access IEmailQueryOptions_Interface
      ; value : Windows.ApplicationModel.Email.EmailQueryKind
   )
   return Windows.HRESULT is abstract;
   
   function get_FolderIds
   (
      This       : access IEmailQueryOptions_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailConversationBatch : aliased constant Windows.IID := (3099700097, 453, 17194, (157, 241, 254, 133, 217, 138, 39, 154 ));
   
   type IEmailConversationBatch_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Conversations
   (
      This       : access IEmailConversationBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVectorView_IEmailConversation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IEmailConversationBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailBatchStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailConversationReader : aliased constant Windows.IID := (3026390914, 10357, 17608, (155, 140, 133, 190, 179, 163, 198, 83 ));
   
   type IEmailConversationReader_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchAsync
   (
      This       : access IEmailConversationReader_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailConversationBatch -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMessageBatch : aliased constant Windows.IID := (1616695439, 9689, 20251, (158, 81, 5, 20, 192, 20, 150, 83 ));
   
   type IEmailMessageBatch_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Messages
   (
      This       : access IEmailMessageBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVectorView_IEmailMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IEmailMessageBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailBatchStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMessageReader : aliased constant Windows.IID := (793427615, 25107, 19077, (163, 176, 249, 45, 26, 131, 157, 25 ));
   
   type IEmailMessageReader_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchAsync
   (
      This       : access IEmailMessageReader_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessageBatch -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxChange : aliased constant Windows.IID := (1642984779, 4591, 16396, (173, 222, 140, 222, 101, 200, 94, 102 ));
   
   type IEmailMailboxChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeType
   (
      This       : access IEmailMailboxChange_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxChangeType
   )
   return Windows.HRESULT is abstract;
   
   function get_MailboxActions
   (
      This       : access IEmailMailboxChange_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVector_IEmailMailboxAction -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IEmailMailboxChange_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_Folder
   (
      This       : access IEmailMailboxChange_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailFolder
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxChangeReader : aliased constant Windows.IID := (3183283899, 50493, 17201, (151, 190, 190, 117, 162, 20, 106, 117 ));
   
   type IEmailMailboxChangeReader_Interface is interface and Windows.IInspectable_Interface;
   
   function AcceptChanges
   (
      This       : access IEmailMailboxChangeReader_Interface
   )
   return Windows.HRESULT is abstract;
   
   function AcceptChangesThrough
   (
      This       : access IEmailMailboxChangeReader_Interface
      ; lastChangeToAcknowledge : Windows.ApplicationModel.Email.IEmailMailboxChange
   )
   return Windows.HRESULT is abstract;
   
   function ReadBatchAsync
   (
      This       : access IEmailMailboxChangeReader_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMailboxChangeTracker : aliased constant Windows.IID := (2061796920, 20838, 17079, (136, 130, 253, 33, 201, 43, 221, 75 ));
   
   type IEmailMailboxChangeTracker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTracking
   (
      This       : access IEmailMailboxChangeTracker_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Enable
   (
      This       : access IEmailMailboxChangeTracker_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetChangeReader
   (
      This       : access IEmailMailboxChangeTracker_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxChangeReader
   )
   return Windows.HRESULT is abstract;
   
   function Reset
   (
      This       : access IEmailMailboxChangeTracker_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMeetingInfo : aliased constant Windows.IID := (834682793, 31027, 16735, (162, 117, 209, 101, 186, 7, 2, 107 ));
   
   type IEmailMeetingInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowNewTimeProposal
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowNewTimeProposal
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentRoamingId
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AppointmentRoamingId
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentOriginalStartTime
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_AppointmentOriginalStartTime
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAllDay
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAllDay
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsResponseRequested
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsResponseRequested
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Location
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProposedStartTime
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ProposedStartTime
   (
      This       : access IEmailMeetingInfo_Interface
      ; proposedStartTime : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ProposedDuration
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ProposedDuration
   (
      This       : access IEmailMeetingInfo_Interface
      ; duration : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_RecurrenceStartTime
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_RecurrenceStartTime
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Recurrence
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function put_Recurrence
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.ApplicationModel.Appointments.IAppointmentRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteChangeNumber
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteChangeNumber
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTime
   (
      This       : access IEmailMeetingInfo_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_StartTime
   (
      This       : access IEmailMeetingInfo_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailMeetingInfo2 : aliased constant Windows.IID := (2119776365, 45273, 20453, (134, 124, 227, 30, 210, 181, 136, 184 ));
   
   type IEmailMeetingInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsReportedOutOfDateByServer
   (
      This       : access IEmailMeetingInfo2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmailItemCounts : aliased constant Windows.IID := (1540436769, 65224, 19371, (131, 186, 11, 175, 60, 31, 108, 189 ));
   
   type IEmailItemCounts_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Flagged
   (
      This       : access IEmailItemCounts_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Important
   (
      This       : access IEmailItemCounts_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Total
   (
      This       : access IEmailItemCounts_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Unread
   (
      This       : access IEmailItemCounts_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEmailStore : aliased constant Windows.IID := (2090727825, 23961, 21940, (180, 57, 6, 78, 221, 9, 122, 196 ));
   
   type IAsyncOperation_IEmailStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEmailStore_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEmailStore_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEmailStore_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEmailMailbox : aliased constant Windows.IID := (1862398046, 39053, 23336, (171, 168, 219, 170, 187, 78, 176, 217 ));
   
   type IAsyncOperation_IEmailMailbox_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEmailMailbox_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailMailbox
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEmailMailbox_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailMailbox
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEmailMailbox_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailbox
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEmailConversation : aliased constant Windows.IID := (1753585260, 5049, 22988, (179, 88, 173, 248, 46, 236, 132, 42 ));
   
   type IAsyncOperation_IEmailConversation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEmailConversation_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailConversation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEmailConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailConversation
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEmailConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailConversation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEmailFolder : aliased constant Windows.IID := (1630676815, 29501, 21393, (144, 119, 8, 103, 252, 51, 9, 22 ));
   
   type IAsyncOperation_IEmailFolder_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEmailFolder_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEmailFolder_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailFolder
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEmailFolder_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailFolder
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEmailMessage : aliased constant Windows.IID := (1930785049, 64088, 23853, (129, 124, 181, 99, 12, 21, 17, 228 ));
   
   type IAsyncOperation_IEmailMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEmailMessage_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEmailMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailMessage
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEmailMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IEmailRecipient : aliased constant Windows.IID := (304319880, 6703, 24186, (137, 177, 141, 193, 64, 83, 107, 172 ));
   
   type IIterator_IEmailRecipient_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IEmailRecipient_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IEmailRecipient_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IEmailRecipient_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IEmailRecipient_Interface
      ; items : Windows.ApplicationModel.Email.IEmailRecipient_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IEmailRecipient : aliased constant Windows.IID := (1595460274, 9069, 24261, (188, 100, 227, 230, 61, 41, 231, 116 ));
   
   type IIterable_IEmailRecipient_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IEmailRecipient_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IIterator_IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IEmailRecipient : aliased constant Windows.IID := (4141264736, 61722, 23555, (128, 204, 71, 52, 7, 165, 170, 191 ));
   
   type IVectorView_IEmailRecipient_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IEmailRecipient_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IEmailRecipient_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IEmailRecipient_Interface
      ; value : Windows.ApplicationModel.Email.IEmailRecipient
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IEmailRecipient_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Email.IEmailRecipient_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IEmailRecipient : aliased constant Windows.IID := (290584164, 14789, 23210, (138, 46, 51, 80, 230, 17, 98, 75 ));
   
   type IVector_IEmailRecipient_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IEmailRecipient_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IEmailRecipient_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IEmailRecipient_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVectorView_IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IEmailRecipient_Interface
      ; value : Windows.ApplicationModel.Email.IEmailRecipient
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IEmailRecipient_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IEmailRecipient_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IEmailRecipient_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IEmailRecipient_Interface
      ; value : Windows.ApplicationModel.Email.IEmailRecipient
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IEmailRecipient_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IEmailRecipient_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IEmailRecipient_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Email.IEmailRecipient_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IEmailRecipient_Interface
      ; items : Windows.ApplicationModel.Email.IEmailRecipient_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IEmailAttachment : aliased constant Windows.IID := (1147493256, 39577, 22932, (142, 15, 91, 150, 64, 146, 65, 32 ));
   
   type IIterator_IEmailAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IEmailAttachment_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailAttachment
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IEmailAttachment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IEmailAttachment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IEmailAttachment_Interface
      ; items : Windows.ApplicationModel.Email.IEmailAttachment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IEmailAttachment : aliased constant Windows.IID := (2779447524, 3799, 21230, (170, 203, 131, 216, 64, 214, 248, 250 ));
   
   type IIterable_IEmailAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IEmailAttachment_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IIterator_IEmailAttachment
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IEmailAttachment : aliased constant Windows.IID := (493992166, 16193, 20940, (137, 75, 219, 193, 14, 188, 157, 82 ));
   
   type IVectorView_IEmailAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IEmailAttachment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Email.IEmailAttachment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IEmailAttachment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IEmailAttachment_Interface
      ; value : Windows.ApplicationModel.Email.IEmailAttachment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IEmailAttachment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Email.IEmailAttachment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IEmailAttachment : aliased constant Windows.IID := (129035208, 28847, 24043, (152, 97, 220, 147, 226, 176, 56, 233 ));
   
   type IVector_IEmailAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IEmailAttachment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Email.IEmailAttachment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IEmailAttachment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IEmailAttachment_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVectorView_IEmailAttachment
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IEmailAttachment_Interface
      ; value : Windows.ApplicationModel.Email.IEmailAttachment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IEmailAttachment_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Email.IEmailAttachment
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IEmailAttachment_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Email.IEmailAttachment
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IEmailAttachment_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IEmailAttachment_Interface
      ; value : Windows.ApplicationModel.Email.IEmailAttachment
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IEmailAttachment_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IEmailAttachment_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IEmailAttachment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Email.IEmailAttachment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IEmailAttachment_Interface
      ; items : Windows.ApplicationModel.Email.IEmailAttachment_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_EmailMailboxSmimeEncryptionAlgorithm : aliased constant Windows.IID := (1127944781, 24806, 23418, (150, 188, 134, 129, 222, 95, 94, 117 ));
   
   type IReference_EmailMailboxSmimeEncryptionAlgorithm_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_EmailMailboxSmimeEncryptionAlgorithm_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxSmimeEncryptionAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_EmailMailboxSmimeSigningAlgorithm : aliased constant Windows.IID := (3835209250, 61800, 20740, (165, 59, 250, 249, 150, 245, 22, 50 ));
   
   type IReference_EmailMailboxSmimeSigningAlgorithm_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_EmailMailboxSmimeSigningAlgorithm_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxSmimeSigningAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEmailMailboxAutoReplySettings : aliased constant Windows.IID := (3008681156, 58528, 23100, (184, 151, 141, 235, 69, 138, 198, 115 ));
   
   type IAsyncOperation_IEmailMailboxAutoReplySettings_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEmailMailboxAutoReplySettings_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEmailMailboxAutoReplySettings_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEmailMailboxAutoReplySettings_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxAutoReplySettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_EmailMailboxEmptyFolderStatus : aliased constant Windows.IID := (3385166, 39850, 24400, (141, 110, 35, 134, 53, 230, 253, 211 ));
   
   type IAsyncOperation_EmailMailboxEmptyFolderStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_EmailMailboxEmptyFolderStatus_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_EmailMailboxEmptyFolderStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_EmailMailboxEmptyFolderStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEmailMailboxCreateFolderResult : aliased constant Windows.IID := (1834618497, 26953, 20729, (191, 251, 146, 190, 18, 22, 114, 77 ));
   
   type IAsyncOperation_IEmailMailboxCreateFolderResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEmailMailboxCreateFolderResult_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEmailMailboxCreateFolderResult_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEmailMailboxCreateFolderResult_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxCreateFolderResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_EmailMailboxDeleteFolderStatus : aliased constant Windows.IID := (1751185535, 663, 23263, (170, 22, 159, 31, 8, 226, 217, 80 ));
   
   type IAsyncOperation_EmailMailboxDeleteFolderStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_EmailMailboxDeleteFolderStatus_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_EmailMailboxDeleteFolderStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_EmailMailboxDeleteFolderStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEmailItemCounts : aliased constant Windows.IID := (1482062093, 20996, 23193, (182, 158, 199, 22, 47, 210, 88, 105 ));
   
   type IAsyncOperation_IEmailItemCounts_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEmailItemCounts_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailItemCounts
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEmailItemCounts_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailItemCounts
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEmailItemCounts_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailItemCounts
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IEmailConversation : aliased constant Windows.IID := (4208646695, 58921, 23092, (178, 233, 29, 37, 201, 53, 68, 181 ));
   
   type IIterator_IEmailConversation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IEmailConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailConversation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IEmailConversation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IEmailConversation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IEmailConversation_Interface
      ; items : Windows.ApplicationModel.Email.IEmailConversation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IEmailConversation : aliased constant Windows.IID := (3566598364, 17191, 23498, (165, 6, 68, 177, 114, 214, 212, 53 ));
   
   type IIterable_IEmailConversation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IEmailConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IIterator_IEmailConversation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IEmailConversation : aliased constant Windows.IID := (175923927, 64537, 23511, (179, 122, 13, 98, 66, 223, 72, 192 ));
   
   type IVectorView_IEmailConversation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IEmailConversation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Email.IEmailConversation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IEmailConversation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IEmailConversation_Interface
      ; value : Windows.ApplicationModel.Email.IEmailConversation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IEmailConversation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Email.IEmailConversation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEmailConversationBatch : aliased constant Windows.IID := (2106055580, 38013, 24076, (140, 242, 36, 89, 152, 209, 157, 143 ));
   
   type IAsyncOperation_IEmailConversationBatch_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEmailConversationBatch_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailConversationBatch
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEmailConversationBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailConversationBatch
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEmailConversationBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailConversationBatch
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IEmailMessage : aliased constant Windows.IID := (3394673656, 54999, 21521, (150, 0, 171, 149, 236, 6, 92, 114 ));
   
   type IIterator_IEmailMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IEmailMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IEmailMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IEmailMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IEmailMessage_Interface
      ; items : Windows.ApplicationModel.Email.IEmailMessage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IEmailMessage : aliased constant Windows.IID := (2784675875, 36461, 23486, (173, 22, 131, 80, 174, 164, 70, 224 ));
   
   type IIterable_IEmailMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IEmailMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IIterator_IEmailMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IEmailMessage : aliased constant Windows.IID := (1371074034, 27814, 21982, (190, 69, 29, 31, 197, 29, 240, 118 ));
   
   type IVectorView_IEmailMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IEmailMessage_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IEmailMessage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IEmailMessage_Interface
      ; value : Windows.ApplicationModel.Email.IEmailMessage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IEmailMessage_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Email.IEmailMessage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEmailMessageBatch : aliased constant Windows.IID := (939434265, 3870, 20498, (136, 187, 240, 23, 159, 143, 77, 229 ));
   
   type IAsyncOperation_IEmailMessageBatch_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEmailMessageBatch_Interface
      ; handler : Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailMessageBatch
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEmailMessageBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Email.AsyncOperationCompletedHandler_IEmailMessageBatch
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEmailMessageBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMessageBatch
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IEmailMailboxAction : aliased constant Windows.IID := (3118001856, 61664, 23117, (136, 208, 117, 138, 203, 198, 56, 15 ));
   
   type IIterator_IEmailMailboxAction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IEmailMailboxAction_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxAction
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IEmailMailboxAction_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IEmailMailboxAction_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IEmailMailboxAction_Interface
      ; items : Windows.ApplicationModel.Email.IEmailMailboxAction_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IEmailMailboxAction : aliased constant Windows.IID := (641831697, 7383, 23467, (156, 74, 233, 88, 132, 213, 83, 156 ));
   
   type IIterable_IEmailMailboxAction_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IEmailMailboxAction_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IIterator_IEmailMailboxAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IEmailMailboxAction : aliased constant Windows.IID := (4156419985, 48895, 23522, (142, 249, 47, 129, 18, 229, 154, 111 ));
   
   type IVectorView_IEmailMailboxAction_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IEmailMailboxAction_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IEmailMailboxAction_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IEmailMailboxAction_Interface
      ; value : Windows.ApplicationModel.Email.IEmailMailboxAction
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IEmailMailboxAction_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Email.IEmailMailboxAction_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IEmailMailboxAction : aliased constant Windows.IID := (1284853426, 61788, 22633, (171, 215, 46, 50, 141, 228, 164, 175 ));
   
   type IVector_IEmailMailboxAction_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IEmailMailboxAction_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IEmailMailboxAction_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IEmailMailboxAction_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVectorView_IEmailMailboxAction
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IEmailMailboxAction_Interface
      ; value : Windows.ApplicationModel.Email.IEmailMailboxAction
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IEmailMailboxAction_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Email.IEmailMailboxAction
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IEmailMailboxAction_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Email.IEmailMailboxAction
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IEmailMailboxAction_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IEmailMailboxAction_Interface
      ; value : Windows.ApplicationModel.Email.IEmailMailboxAction
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IEmailMailboxAction_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IEmailMailboxAction_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IEmailMailboxAction_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Email.IEmailMailboxAction_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IEmailMailboxAction_Interface
      ; items : Windows.ApplicationModel.Email.IEmailMailboxAction_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IEmailRecipientResolutionResult : aliased constant Windows.IID := (1543769302, 38291, 24180, (154, 94, 114, 132, 205, 27, 114, 0 ));
   
   type IIterator_IEmailRecipientResolutionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IEmailRecipientResolutionResult_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailRecipientResolutionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IEmailRecipientResolutionResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IEmailRecipientResolutionResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IEmailRecipientResolutionResult_Interface
      ; items : Windows.ApplicationModel.Email.IEmailRecipientResolutionResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IEmailRecipientResolutionResult : aliased constant Windows.IID := (3403923908, 50825, 22407, (151, 111, 26, 21, 143, 253, 209, 107 ));
   
   type IIterable_IEmailRecipientResolutionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IEmailRecipientResolutionResult_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IIterator_IEmailRecipientResolutionResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_EmailCertificateValidationStatus : aliased constant Windows.IID := (486423873, 5797, 20518, (166, 254, 44, 176, 163, 3, 166, 5 ));
   
   type IIterator_EmailCertificateValidationStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_EmailCertificateValidationStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailCertificateValidationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_EmailCertificateValidationStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_EmailCertificateValidationStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_EmailCertificateValidationStatus_Interface
      ; items : Windows.ApplicationModel.Email.EmailCertificateValidationStatus_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_EmailCertificateValidationStatus : aliased constant Windows.IID := (2117231920, 29769, 20903, (177, 188, 196, 53, 51, 167, 142, 6 ));
   
   type IIterable_EmailCertificateValidationStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_EmailCertificateValidationStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IIterator_EmailCertificateValidationStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEmailStore : aliased constant Windows.IID := (3719782867, 29112, 23627, (173, 139, 30, 101, 34, 102, 73, 33 ));
   
   type AsyncOperationCompletedHandler_IEmailStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEmailStore'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEmailMailbox : aliased constant Windows.IID := (1298094047, 57564, 23797, (178, 229, 250, 30, 92, 0, 6, 250 ));
   
   type AsyncOperationCompletedHandler_IEmailMailbox_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailbox ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEmailMailbox'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailMailbox_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailbox
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEmailConversation : aliased constant Windows.IID := (43305117, 36248, 21314, (184, 47, 1, 16, 36, 21, 200, 112 ));
   
   type AsyncOperationCompletedHandler_IEmailConversation_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailConversation ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEmailConversation'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailConversation_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailConversation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEmailFolder : aliased constant Windows.IID := (4055265015, 1317, 23973, (163, 214, 178, 91, 63, 83, 58, 161 ));
   
   type AsyncOperationCompletedHandler_IEmailFolder_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailFolder ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEmailFolder'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailFolder_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailFolder
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEmailMessage : aliased constant Windows.IID := (1775312158, 61627, 24347, (172, 181, 18, 12, 38, 254, 189, 237 ));
   
   type AsyncOperationCompletedHandler_IEmailMessage_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessage ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEmailMessage'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailMessage_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessage
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IEmailMailbox_add_MailboxChanged : aliased constant Windows.IID := (544774925, 5461, 20988, (135, 165, 34, 34, 37, 11, 155, 6 ));
   
   type TypedEventHandler_IEmailMailbox_add_MailboxChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.IEmailMailbox ; args : Windows.ApplicationModel.Email.IEmailMailboxChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IEmailMailbox_add_MailboxChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IEmailMailbox_add_MailboxChanged_Interface
      ; sender : Windows.ApplicationModel.Email.IEmailMailbox
      ; args : Windows.ApplicationModel.Email.IEmailMailboxChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings : aliased constant Windows.IID := (3753977690, 51120, 24548, (147, 112, 50, 185, 74, 208, 186, 142 ));
   
   type AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailboxAutoReplySettings ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailboxAutoReplySettings
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus : aliased constant Windows.IID := (1345531909, 56045, 22142, (187, 136, 177, 188, 70, 99, 176, 117 ));
   
   type AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_EmailMailboxEmptyFolderStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_EmailMailboxEmptyFolderStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult : aliased constant Windows.IID := (2459897818, 62288, 21950, (133, 85, 233, 141, 129, 234, 241, 165 ));
   
   type AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailboxCreateFolderResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailboxCreateFolderResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus : aliased constant Windows.IID := (1382043046, 18523, 21573, (142, 111, 100, 204, 19, 5, 96, 69 ));
   
   type AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_EmailMailboxDeleteFolderStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_EmailMailboxDeleteFolderStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged : aliased constant Windows.IID := (1555980731, 54805, 23426, (187, 17, 65, 46, 50, 102, 76, 7 ));
   
   type TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.IEmailMailboxSyncManager ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged_Interface
      ; sender : Windows.ApplicationModel.Email.IEmailMailboxSyncManager
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEmailItemCounts : aliased constant Windows.IID := (46481952, 57048, 21653, (132, 29, 212, 50, 200, 121, 184, 38 ));
   
   type AsyncOperationCompletedHandler_IEmailItemCounts_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailItemCounts ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEmailItemCounts'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailItemCounts_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailItemCounts
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEmailConversationBatch : aliased constant Windows.IID := (4047528067, 10869, 22310, (186, 72, 144, 227, 46, 173, 215, 250 ));
   
   type AsyncOperationCompletedHandler_IEmailConversationBatch_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailConversationBatch ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEmailConversationBatch'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailConversationBatch_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailConversationBatch
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEmailMessageBatch : aliased constant Windows.IID := (3060220309, 34808, 21877, (145, 8, 156, 86, 33, 213, 41, 177 ));
   
   type AsyncOperationCompletedHandler_IEmailMessageBatch_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessageBatch ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEmailMessageBatch'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailMessageBatch_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessageBatch
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype EmailMessage is Windows.ApplicationModel.Email.IEmailMessage;
   function Create return Windows.ApplicationModel.Email.IEmailMessage;
   
   subtype EmailStore is Windows.ApplicationModel.Email.IEmailStore;
   subtype EmailManagerForUser is Windows.ApplicationModel.Email.IEmailManagerForUser;
   subtype EmailMailbox is Windows.ApplicationModel.Email.IEmailMailbox;
   subtype EmailConversationReader is Windows.ApplicationModel.Email.IEmailConversationReader;
   subtype EmailQueryOptions is Windows.ApplicationModel.Email.IEmailQueryOptions;
   function Create return Windows.ApplicationModel.Email.IEmailQueryOptions;
   
   function CreateWithText
   (
      text : Windows.String
   )
   return Windows.ApplicationModel.Email.IEmailQueryOptions;
   
   function CreateWithTextAndFields
   (
      text : Windows.String
      ; fields : Windows.ApplicationModel.Email.EmailQuerySearchFields
   )
   return Windows.ApplicationModel.Email.IEmailQueryOptions;
   
   subtype EmailMessageReader is Windows.ApplicationModel.Email.IEmailMessageReader;
   subtype EmailConversation is Windows.ApplicationModel.Email.IEmailConversation;
   subtype EmailFolder is Windows.ApplicationModel.Email.IEmailFolder;
   subtype EmailRecipient is Windows.ApplicationModel.Email.IEmailRecipient;
   function Create return Windows.ApplicationModel.Email.IEmailRecipient;
   
   function Create
   (
      address : Windows.String
   )
   return Windows.ApplicationModel.Email.IEmailRecipient;
   
   function CreateWithName
   (
      address : Windows.String
      ; name : Windows.String
   )
   return Windows.ApplicationModel.Email.IEmailRecipient;
   
   subtype EmailIrmTemplate is Windows.ApplicationModel.Email.IEmailIrmTemplate;
   function Create return Windows.ApplicationModel.Email.IEmailIrmTemplate;
   
   function Create
   (
      id : Windows.String
      ; name : Windows.String
      ; description : Windows.String
   )
   return Windows.ApplicationModel.Email.IEmailIrmTemplate;
   
   subtype EmailIrmInfo is Windows.ApplicationModel.Email.IEmailIrmInfo;
   function Create return Windows.ApplicationModel.Email.IEmailIrmInfo;
   
   function Create
   (
      expiration : Windows.Foundation.DateTime
      ; irmTemplate : Windows.ApplicationModel.Email.IEmailIrmTemplate
   )
   return Windows.ApplicationModel.Email.IEmailIrmInfo;
   
   subtype EmailAttachment is Windows.ApplicationModel.Email.IEmailAttachment;
   function Create return Windows.ApplicationModel.Email.IEmailAttachment;
   
   function Create
   (
      fileName : Windows.String
      ; data : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.ApplicationModel.Email.IEmailAttachment;
   
   function Create
   (
      fileName : Windows.String
      ; data : Windows.Storage.Streams.IRandomAccessStreamReference
      ; mimeType : Windows.String
   )
   return Windows.ApplicationModel.Email.IEmailAttachment;
   
   subtype EmailMeetingInfo is Windows.ApplicationModel.Email.IEmailMeetingInfo;
   function Create return Windows.ApplicationModel.Email.IEmailMeetingInfo;
   
   subtype EmailMailboxChangedDeferral is Windows.ApplicationModel.Email.IEmailMailboxChangedDeferral;
   subtype EmailMailboxCapabilities is Windows.ApplicationModel.Email.IEmailMailboxCapabilities;
   subtype EmailMailboxChangeTracker is Windows.ApplicationModel.Email.IEmailMailboxChangeTracker;
   subtype EmailMailboxPolicies is Windows.ApplicationModel.Email.IEmailMailboxPolicies;
   subtype EmailMailboxSyncManager is Windows.ApplicationModel.Email.IEmailMailboxSyncManager;
   subtype EmailMailboxChangedEventArgs is Windows.ApplicationModel.Email.IEmailMailboxChangedEventArgs;
   subtype EmailMailboxAutoReplySettings is Windows.ApplicationModel.Email.IEmailMailboxAutoReplySettings;
   function Create return Windows.ApplicationModel.Email.IEmailMailboxAutoReplySettings;
   
   subtype EmailRecipientResolutionResult is Windows.ApplicationModel.Email.IEmailRecipientResolutionResult;
   function Create return Windows.ApplicationModel.Email.IEmailRecipientResolutionResult;
   
   subtype EmailMailboxCreateFolderResult is Windows.ApplicationModel.Email.IEmailMailboxCreateFolderResult;
   subtype EmailMailboxAutoReply is Windows.ApplicationModel.Email.IEmailMailboxAutoReply;
   subtype EmailItemCounts is Windows.ApplicationModel.Email.IEmailItemCounts;
   subtype EmailQueryTextSearch is Windows.ApplicationModel.Email.IEmailQueryTextSearch;
   subtype EmailConversationBatch is Windows.ApplicationModel.Email.IEmailConversationBatch;
   subtype EmailMessageBatch is Windows.ApplicationModel.Email.IEmailMessageBatch;
   subtype EmailMailboxAction is Windows.ApplicationModel.Email.IEmailMailboxAction;
   subtype EmailMailboxChange is Windows.ApplicationModel.Email.IEmailMailboxChange;
   subtype EmailMailboxChangeReader is Windows.ApplicationModel.Email.IEmailMailboxChangeReader;
   subtype EmailStoreNotificationTriggerDetails is Windows.ApplicationModel.Email.IEmailStoreNotificationTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function ShowComposeNewEmailAsync
   (
      message : Windows.ApplicationModel.Email.IEmailMessage
   )
   return Windows.Foundation.IAsyncAction;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Email.IEmailManagerForUser;
   
   function RequestStoreAsync
   (
      accessType : Windows.ApplicationModel.Email.EmailStoreAccessType
   )
   return Windows.ApplicationModel.Email.IAsyncOperation_IEmailStore;
   
end;
