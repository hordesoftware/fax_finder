module FaxFinder
  class Response
    attr_reader :doc, :state, :fax_entry_url, :fax_key, :entry_key, :try_number
    REGEXP_KEYS=/([0-9A-F]+)\/([0-9A-F]+)$/
    XPATH_STATE='//fax_entry/state'
    XPATH_FAX_ENTRY_URL='//fax_entry/fax_entry_url'
    XPATH_TRY_NUMBER='//fax_entry/try_number'
    def initialize(_doc)
      @doc=_doc
      if self.doc
        @state=self.doc.xpath(XPATH_STATE).text
        @fax_entry_url=self.doc.xpath(XPATH_FAX_ENTRY_URL).text
        @fax_key, @entry_key=self.extract_fax_and_entry_key(self.fax_entry_url)
        @try_number=self.doc.xpath(XPATH_TRY_NUMBER).text.to_i
      end
    end

    def extract_fax_and_entry_key(_url)
      match=REGEXP_KEYS.match(_url)
      match[1,2] if match
    end

  end
  
end