Rails.application.configure do
    config.content_security_policy do |policy|
      policy.default_src :self, :https
      policy.font_src    :self, :https, :data, 'stackpath.bootstrapcdn.com', 'cdn.scite.ai'
      policy.img_src     :self, :https, :data, 'gighive.tech', '102.37.33.129'  # Add your local VM IP or hostname
      policy.object_src  :none
      policy.script_src  :self, :https, 'code.jquery.com', 'stackpath.bootstrapcdn.com'
      policy.style_src   :self, :https, 'stackpath.bootstrapcdn.com', 'cdn.scite.ai', :unsafe_inline
      # Specify URI for violation reports
      # policy.report_uri "/csp-violation-report-endpoint"
    end
  
    # Generate session nonces for permitted importmap and inline scripts
    config.content_security_policy_nonce_generator = ->(request) { request.session.id.to_s }
    config.content_security_policy_nonce_directives = %w(script-src)
  
    # Report violations without enforcing the policy.
    # config.content_security_policy_report_only = true
  end
  