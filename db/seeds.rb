Product.delete_all

Product.create!(title: 'Docker for Rails Developers', description:
%{<p>
<em> Robust, Reliable, and Resilient</em>
APIs are transforming the business world at an increasing pace. Gain
the essential skills needed to quickly design, build, and deploy
quality web APIs that are robust, reliable, and resilient. Go from
initial design through prototyping and implementation to deployment of
mission-critical APIs for your organization. Test, secure, and deploy
your API with confidence and avoid the “release into production”
panic. Tackle just about any API challenge with more than a dozen
open-source utilities and common programming patterns you can apply
right away.
</p>
}, image_url: 'ridocker.jpg', price: 24.95)

Product.create!(title: 'Design and Build Great Web APIs', description:
%{<p>
<em> Robust, Reliable, and Resilient</em>
APIs are transforming the business world at an increasing pace. Gain
the essential skills needed to quickly design, build, and deploy
quality web APIs that are robust, reliable, and resilient. Go from
initial design through prototyping and implementation to deployment of
mission-critical APIs for your organization. Test, secure, and deploy
your API with confidence and avoid the “release into production”
panic. Tackle just about any API challenge with more than a dozen
open-source utilities and common programming patterns you can apply
right away.
</p>
}, image_url: 'maapis.jpg', price: 24.95)

User.create! name: 'dave',
    password: Rails.application.credentials.dave_password
