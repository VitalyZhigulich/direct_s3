class UploadsController < ApplicationController
  def create
    blob_signed_ids = params[:files]
    purpose = ActiveStorage::Blob.combine_signed_id_purposes(:blob_id)
    blob_ids = blob_signed_ids.map do |signed_id|
      ActiveStorage::Blob.signed_id_verifier.verified(signed_id, purpose: purpose)
    end

    @blobs = ActiveStorage::Blob.where(id: blob_ids)
  end
end
